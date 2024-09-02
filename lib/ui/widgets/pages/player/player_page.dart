import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  PlayerTextStateData(
                    :final currentTextLine
                  ) =>
                    bloc.add(PlayerEventJumpToLineRequested(currentTextLine - 1)),
                  _ => null,
                },
            const SingleActivator(LogicalKeyboardKey.arrowDown): () => switch (bloc.state.textState) {
                  PlayerTextStateData(
                    :final currentTextLine
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
                _Time(),
                _PlayButton(),
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
      child: GestureDetector(
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
        PlayerTextStateData(
          :final currentTextLine,
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
  const _Time();

  @override
  Widget build(final BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _CurrentTime(),
          _TotalTime(),
        ],
      ),
    );
  }
}

class _CurrentTime extends StatelessWidget {
  const _CurrentTime();

  @override
  Widget build(final BuildContext context) {
    late final PlayerBloc bloc;
    var isInitialized = false;
    final position = context.select((final PlayerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state.audioState) {
        StatusOfData<PlayerAudioState>(
          data: PlayerAudioState(
            :final position,
          ),
        ) =>
          position,
        _ => null,
      };
    });

    return Text(_formatTime(position ?? Duration.zero));
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

    return Text(_formatTime(duration ?? const Duration(seconds: 1)));
  }
}

class _Slider extends StatelessWidget {
  const _Slider();

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

    return MediaQuery(
      data: const MediaQueryData(navigationMode: NavigationMode.directional),
      child: switch (bloc.state.audioState) {
        StatusOfData<PlayerAudioState>(
          data: PlayerAudioState(
            :final position,
            :final duration,
          ),
        ) =>
          Slider(
            max: duration.inMilliseconds.toDouble(),
            value: position.inMilliseconds.toDouble(),
            onChangeStart: (final _) => bloc.add(const PlayerEventStartedSeeking()),
            onChanged: (final newValue) => bloc.add(PlayerEventPositionChanged(position: Duration(milliseconds: newValue.toInt()))),
            onChangeEnd: (final newValue) => bloc.add(PlayerEventSeekRequested(Duration(milliseconds: newValue.toInt()))),
          ),
        _ => const Slider(
            value: 0,
            onChanged: null,
          ),
      },
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
