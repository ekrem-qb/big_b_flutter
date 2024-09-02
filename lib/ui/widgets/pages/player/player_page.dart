import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_slider/interactive_slider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../api/entity/recording/recording.dart';
import '../../../entity/status.dart';
import '../../error_panel.dart';
import '../../extensions/fade_transition_builder.dart';
import '../../extensions/mouse_navigator.dart';
import '../../extensions/separator.dart';
import '../../extensions/shimmer.dart';
import '../../extensions/smooth_mouse_scroll/positioned_smooth_mouse_scroll.dart';
import '../../extensions/snackbar.dart';
import 'bloc/player_bloc.dart';

@RoutePage()
class PlayerPage extends StatelessWidget {
  const PlayerPage({
    @pathParam required this.id,
    this.recording,
    super.key,
  });

  final int id;
  final Recording? recording;

  @override
  Widget build(final BuildContext context) {
    return MouseNavigator(
      child: BlocProvider(
        create: (final context) => PlayerBloc(id: id, recording: recording),
        child: const PlayerView(),
      ),
    );
  }
}

class PlayerView extends StatelessWidget {
  const PlayerView({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return BlocListener<PlayerBloc, PlayerState>(
      listenWhen: (final previous, final current) =>
          switch (previous.audioState) {
            StatusOfError(
              :final error,
            ) =>
              error,
            _ => null,
          } !=
          switch (current.audioState) {
            StatusOfError(
              :final error,
            ) =>
              error,
            _ => null,
          },
      listener: (final context, final state) {
        if (state.audioState
            case StatusOfError(
              :final error,
            )) {
          showSnackbar(text: error, context: context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: const _Player(),
      ),
    );
  }
}

class _Player extends StatelessWidget {
  const _Player();

  @override
  Widget build(final BuildContext context) {
    late final PlayerBloc bloc;
    var isInitialized = false;
    context.select((final PlayerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return bloc.state.recordingState.runtimeType;
    });

    return switch (bloc.state.recordingState) {
      StatusOfLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
      StatusOfError(
        :final error,
      ) =>
        ErrorPanel(
          error: error,
          onRefresh: () => bloc.add(const PlayerEventLoadRequested()),
        ),
      StatusOfData() => CallbackShortcuts(
          bindings: {
            const SingleActivator(LogicalKeyboardKey.arrowUp): () => switch (bloc.state.textState) {
                  StatusOfData(
                    data: PlayerTextStateData(
                      :final currentTextLine
                    )
                  ) =>
                    bloc.add(PlayerEventJumpToLineRequested(currentTextLine - 1)),
                  _ => null,
                },
            const SingleActivator(LogicalKeyboardKey.arrowDown): () => switch (bloc.state.textState) {
                  StatusOfData(
                    data: PlayerTextStateData(
                      :final currentTextLine
                    )
                  ) =>
                    bloc.add(PlayerEventJumpToLineRequested(currentTextLine + 1)),
                  _ => null,
                },
            const SingleActivator(LogicalKeyboardKey.space, includeRepeats: false): () => bloc.add(const PlayerEventPlayPauseButtonPressed()),
          },
          child: const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                _Text(),
                _Slider(),
              ],
            ),
          ),
        ),
    };
  }
}

const _gradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Colors.transparent,
    Color.fromRGBO(255, 255, 255, 0.05),
    Color.fromRGBO(255, 255, 255, 0.25),
    Color.fromRGBO(255, 255, 255, 0.75),
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Color.fromRGBO(255, 255, 255, 0.75),
    Color.fromRGBO(255, 255, 255, 0.5),
    Color.fromRGBO(255, 255, 255, 0.25),
    Colors.transparent,
  ],
);

class _Text extends StatelessWidget {
  const _Text();

  @override
  Widget build(final BuildContext context) {
    late final PlayerBloc bloc;
    var isInitialized = false;
    context.select((final PlayerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return bloc.state.textState.runtimeType;
    });
    final theme = Theme.of(context);

    return Expanded(
      child: AnimatedSwitcher(
        duration: Durations.medium1,
        transitionBuilder: fadeTransitionBuilder,
        child: switch (bloc.state.textState) {
          StatusOfLoading() => Shimmer.fromColors(
              baseColor: Color.lerp(theme.colorScheme.onSurface, theme.colorScheme.surfaceContainerLow, 0.85)!,
              highlightColor: theme.colorScheme.onSurface,
              child: ShaderMask(
                shaderCallback: _gradient.createShader,
                child: LayoutBuilder(
                  builder: (final context, final constraints) {
                    return ScrollablePositionedList.separated(
                      itemCount: 100,
                      padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.5),
                      separatorBuilder: separatorBuilder,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (final context, final index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            '',
                            style: theme.textTheme.titleLarge,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          StatusOfError(
            :final error,
          ) =>
            ErrorPanel(
              error: error,
              onRefresh: () => bloc.add(const PlayerEventTextLoadRequested()),
            ),
          StatusOfData() => const _LoadedText(),
        },
      ),
    );
  }
}

class _LoadedText extends StatelessWidget {
  const _LoadedText();

  Widget _item(final PlayerBloc bloc, final int index) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => bloc.add(PlayerEventJumpToLineRequested(index)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: _TextLine(index: index),
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    late final PlayerBloc bloc;
    var isInitialized = false;
    context.select((final PlayerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state.textState) {
        StatusOfData<PlayerTextState>(
          :final data,
        ) =>
          data.runtimeType,
        _ => null,
      };
    });

    return switch (bloc.state.textState) {
      StatusOfData<PlayerTextState>(
        :final data,
      ) =>
        switch (data) {
          PlayerTextStateData(
            :final textSpans,
            :final currentTextLine,
          ) =>
            ShaderMask(
              shaderCallback: _gradient.createShader,
              child: LayoutBuilder(
                builder: (final context, final constraints) {
                  return PositionedSmoothMouseScroll(
                    builder: (final context, final child, final controller, final physics) {
                      return ScrollablePositionedList.separated(
                        itemScrollController: bloc.scrollController,
                        scrollOffsetController: controller,
                        initialScrollIndex: currentTextLine,
                        physics: physics,
                        itemCount: textSpans.length,
                        padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.5),
                        separatorBuilder: separatorBuilder,
                        itemBuilder: (final context, final index) => _item(bloc, index),
                      );
                    },
                  );
                },
              ),
            ),
          PlayerTextStateProcessing() => const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.cloud_sync_rounded,
                    size: 64,
                  ),
                  SizedBox(height: 36),
                  Text(
                    'AI is processing audio in cloud',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
        },
      _ => const SizedBox.shrink(),
    };
  }
}

class _TextLine extends StatelessWidget {
  const _TextLine({required this.index});

  final int index;

  @override
  Widget build(final BuildContext context) {
    late final PlayerBloc bloc;
    var isInitialized = false;
    context.select((final PlayerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state.textState) {
        StatusOfData(
          data: PlayerTextStateData(
            :final currentTextLine,
          )
        ) =>
          currentTextLine,
        _ => 0,
      };
    });
    final textStyle = Theme.of(context).textTheme.titleLarge;

    return switch (bloc.state.textState) {
      StatusOfData(
        data: PlayerTextStateData(
          :final currentTextLine,
          :final textSpans,
        ),
      ) =>
        Opacity(
          opacity: currentTextLine != index ? 0.5 : 1,
          child: Text.rich(
            textSpans[index],
            style: textStyle,
          ),
        ),
      _ => const SizedBox.shrink()
    };
  }
}

String _formatTime(final Duration duration) {
  final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
  final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
  final time = '$minutes:$seconds';
  return time;
}

class _Time extends StatelessWidget {
  const _Time(this.time);

  final Duration time;

  @override
  Widget build(final BuildContext context) {
    return Text(_formatTime(time));
  }
}

class _TotalTime extends StatelessWidget {
  const _TotalTime();

  @override
  Widget build(final BuildContext context) {
    late final PlayerBloc bloc;
    var isInitialized = false;
    final duration = context.select((final PlayerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state.audioState) {
        StatusOfData<PlayerAudioState>(
          data: PlayerAudioState(
            :final duration,
          ),
        ) =>
          duration,
        _ => null,
      };
    });

    return _Time(duration ?? const Duration(seconds: 1));
  }
}

class _Slider extends StatefulWidget {
  const _Slider();

  @override
  State<_Slider> createState() => _SliderState();
}

class _SliderState extends State<_Slider> {
  final _controller = InteractiveSliderController(0);

  Duration _duration = const Duration(seconds: 1);
  double _position = 0;
  bool _canAnimate = true;

  @override
  Widget build(final BuildContext context) {
    late final PlayerBloc bloc;
    var isInitialized = false;
    context
      ..select((final PlayerBloc newBloc) {
        if (!isInitialized) {
          bloc = newBloc;
          isInitialized = true;
        }
        return switch (bloc.state.audioState) {
          StatusOfData<PlayerAudioState>(
            data: PlayerAudioState(
              :final position,
            )
          ) =>
            position,
          _ => null,
        };
      })
      ..select((final PlayerBloc newBloc) {
        if (!isInitialized) {
          bloc = newBloc;
          isInitialized = true;
        }
        return bloc.state.audioState.runtimeType;
      });

    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = TextStyle(
      color: colorScheme.onSurface,
    );
    return BlocListener<PlayerBloc, PlayerState>(
      listenWhen: (final previous, final current) {
        final previousAudioState = switch (previous.audioState) {
          StatusOfData<PlayerAudioState>(
            :final data
          ) =>
            data,
          _ => null,
        };
        final currentAudioState = switch (current.audioState) {
          StatusOfData<PlayerAudioState>(
            :final data
          ) =>
            data,
          _ => null,
        };
        return previousAudioState?.duration != currentAudioState?.duration || previousAudioState?.position != currentAudioState?.position;
      },
      listener: (final context, final state) {
        final audioState = state.audioState;
        if (audioState is! StatusOfData<PlayerAudioState>) return;

        _duration = audioState.data.duration;
        _position = audioState.data.position.inMicroseconds / audioState.data.duration.inMicroseconds;
      },
      child: MediaQuery(
        data: const MediaQueryData(navigationMode: NavigationMode.directional),
        child: IgnorePointer(
          ignoring: switch (bloc.state.audioState) {
            StatusOfData<PlayerAudioState>(
              data: PlayerAudioState(),
            ) =>
              false,
            _ => true,
          },
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: _controller.value, end: _position),
            curve: Curves.easeOutExpo,
            duration: _canAnimate ? Durations.short4 : Duration.zero,
            builder: (final context, final value, final child) {
              _controller.value = value;
              _canAnimate = true;
              return child!;
            },
            child: InteractiveSlider(
              unfocusedOpacity: 1,
              foregroundColor: colorScheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              iconPosition: IconPosition.below,
              iconColor: colorScheme.onPrimary,
              iconGap: 24,
              iconSize: 24,
              iconCrossAxisAlignment: CrossAxisAlignment.start,
              controller: _controller,
              startIcon: DefaultTextStyle(
                style: textStyle,
                child: ValueListenableBuilder(
                  valueListenable: _controller,
                  builder: (final context, final value, final child) {
                    return _Time(_duration * value);
                  },
                ),
              ),
              centerIcon: const _PlayButton(),
              endIcon: DefaultTextStyle(
                style: textStyle,
                child: const _TotalTime(),
              ),
              onProgressUpdated: (final newValue) {
                bloc.add(PlayerEventSeekRequested(_duration * newValue));
                _canAnimate = false;
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(final BuildContext context) {
    late final PlayerBloc bloc;
    var isInitialized = false;
    context.select((final PlayerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return bloc.state.audioState.runtimeType;
    });

    return bloc.state.audioState is! StatusOfLoading
        ? IconButton.filled(
            visualDensity: const VisualDensity(
              horizontal: 2,
              vertical: 2,
            ),
            onPressed: bloc.state.audioState is StatusOfData<PlayerAudioState> ? () => bloc.add(const PlayerEventPlayPauseButtonPressed()) : null,
            icon: const _PlayButtonIcon(),
          )
        : const IconButton.filled(
            visualDensity: VisualDensity(
              horizontal: 2,
              vertical: 2,
            ),
            onPressed: null,
            icon: SizedBox.square(
              dimension: 24,
              child: CircularProgressIndicator(),
            ),
          );
  }
}

class _PlayButtonIcon extends StatelessWidget {
  const _PlayButtonIcon();

  @override
  Widget build(final BuildContext context) {
    late final PlayerBloc bloc;
    var isInitialized = false;
    final isPlaying = context.select((final PlayerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state.audioState) {
        StatusOfData<PlayerAudioState>(
          data: PlayerAudioState(
            :final isPlaying,
          ),
        ) =>
          isPlaying,
        _ => false,
      };
    });

    return Icon(
      isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
    );
  }
}
