import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../api/entity/recording/recording.dart';
import '../../../../extensions/duration.dart';
import '../../../app_router/app_router.dart';
import '../../../entity/status.dart';
import '../../../theme.dart';
import '../../error_panel.dart';
import '../../extensions/fade_transition_builder.dart';
import '../../extensions/md3_slider/md3_slider.dart';
import '../../extensions/mouse_navigator.dart';
import '../../extensions/shimmer.dart';
import '../../extensions/smooth_mouse_scroll/positioned_smooth_mouse_scroll.dart';
import '../../extensions/snackbar.dart';
import 'bloc/player_bloc.dart';

const animationDuration = Durations.short4;
const animationCurve = Curves.easeOutExpo;

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
          systemOverlayStyle: Theme.of(context).brightness == Brightness.light ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
          actions: const [
            _ViolationsButton(),
            SizedBox(width: 8),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: const _Player(),
      ),
    );
  }
}

class _ViolationsButton extends StatelessWidget {
  const _ViolationsButton();

  @override
  Widget build(final BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.error_outline),
      label: const Text('İhlaller'),
      onPressed: () {
        final id = context.read<PlayerBloc>().state.id;

        final violations = switch (context.read<PlayerBloc>().state.textState) {
          StatusOfData(
            data: PlayerTextStateData(
              violations: StatusOfData(
                :final data,
              ),
            ),
          ) =>
            data,
          _ => null,
        };

        context.pushRoute(ViolationsRoute(id: id, violations: violations));
      },
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Time(),
                      _PlayButton(),
                      _TotalTime(),
                    ],
                  ),
                ),
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
                    return ScrollablePositionedList.builder(
                      itemCount: 100,
                      padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.5),
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

class _LoadedText extends StatefulWidget {
  const _LoadedText();

  @override
  State<_LoadedText> createState() => _LoadedTextState();
}

class _LoadedTextState extends State<_LoadedText> {
  final scrollController = ItemScrollController();

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

    return BlocListener<PlayerBloc, PlayerState>(
      listenWhen: (final previous, final current) =>
          switch (previous.textState) {
            StatusOfData<PlayerTextStateData>(
              data: PlayerTextStateData(
                :final currentTextLine,
              )
            ) =>
              currentTextLine,
            _ => null,
          } !=
          switch (current.textState) {
            StatusOfData<PlayerTextStateData>(
              data: PlayerTextStateData(
                :final currentTextLine,
              ),
            ) =>
              currentTextLine,
            _ => null,
          },
      listener: (final context, final state) async {
        if (state.textState
            case StatusOfData<PlayerTextStateData>(
              data: PlayerTextStateData(
                :final currentTextLine,
              ),
            )) {
          if (scrollController.isAttached) {
            await scrollController.scrollTo(
              index: currentTextLine,
              alignment: 0.5,
              duration: scrollDuration,
              curve: scrollCurve,
            );
          }
        }
      },
      child: switch (bloc.state.textState) {
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
                        return ScrollablePositionedList.builder(
                          itemScrollController: scrollController,
                          scrollOffsetController: controller,
                          initialScrollIndex: currentTextLine,
                          physics: physics,
                          itemCount: textSpans.length,
                          padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.5),
                          itemBuilder: _TextLine.new,
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
      },
    );
  }
}

class _TextLine extends StatelessWidget {
  const _TextLine(final BuildContext _, this.index);

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

    return switch (bloc.state.textState) {
      StatusOfData(
        data: PlayerTextStateData(
          :final currentTextLine,
          :final textSpans,
          :final textLines,
        ),
      ) =>
        Opacity(
          opacity: currentTextLine != index ? 0.5 : 1,
          child: _TextLineContent(
            text: textSpans[index],
            isEmployee: textLines[index].isEmployee,
            onTap: () => bloc.add(PlayerEventJumpToLineRequested(index)),
          ),
        ),
      _ => const SizedBox.shrink()
    };
  }
}

class _TextLineContent extends StatelessWidget {
  const _TextLineContent({
    required this.text,
    required this.isEmployee,
    required this.onTap,
  });

  final TextSpan text;
  final bool isEmployee;
  final Function() onTap;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      alignment: isEmployee ? Alignment.centerRight : Alignment.centerLeft,
      widthFactor: 0.95,
      child: Align(
        alignment: isEmployee ? Alignment.centerRight : Alignment.centerLeft,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          color: isEmployee
              ? Color.lerp(
                  theme.colorScheme.surfaceContainer,
                  theme.colorScheme.primaryContainer,
                  0.5,
                )
              : null,
          child: InkWell(
            borderRadius: kDefaultRadius,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text.rich(
                text,
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Time extends StatelessWidget {
  const _Time();

  @override
  Widget build(final BuildContext context) {
    final position = context.select((final PlayerBloc bloc) {
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

    return Text((position ?? Duration.zero).toMinutesAndSeconds());
  }
}

class _TotalTime extends StatelessWidget {
  const _TotalTime();

  @override
  Widget build(final BuildContext context) {
    final duration = context.select((final PlayerBloc bloc) {
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

    return Text((duration ?? Duration.zero).toMinutesAndSeconds());
  }
}

class _Slider extends StatefulWidget {
  const _Slider();

  @override
  State<_Slider> createState() => _SliderState();
}

class _SliderState extends State<_Slider> {
  bool _isSeeking = false;
  double _currentValue = 0;
  double _squiggleAmplitude = 0;

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

    final position = context.select((final PlayerBloc newBloc) {
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
          position.inMicroseconds.toDouble(),
        _ => 0.0,
      };
    });

    final duration = context.select((final PlayerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state.audioState) {
        StatusOfData<PlayerAudioState>(
          data: PlayerAudioState(
            :final duration,
          )
        ) =>
          duration.inMicroseconds.toDouble(),
        _ => 0.0,
      };
    });

    final isPlaying = context.select((final PlayerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state.audioState) {
        StatusOfData<PlayerAudioState>(
          data: PlayerAudioState(
            :final isPlaying,
          )
        ) =>
          isPlaying,
        _ => false,
      };
    });

    return IgnorePointer(
      ignoring: switch (bloc.state.audioState) {
        StatusOfData<PlayerAudioState>(
          data: PlayerAudioState(),
        ) =>
          false,
        _ => true,
      },
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: _currentValue, end: position),
        curve: animationCurve,
        duration: animationDuration,
        builder: (final context, final value, final child) {
          if (!_isSeeking) {
            _currentValue = value;
          }

          return TweenAnimationBuilder(
            tween: Tween<double>(begin: _squiggleAmplitude, end: isPlaying ? 1 : 0),
            duration: Durations.short2,
            builder: (final context, final value, final child) {
              _squiggleAmplitude = value;

              return Material3Slider(
                isSquiglySliderEnabled: true,
                squiggleAmplitude: _squiggleAmplitude * 3,
                squiggleWavelength: 5,
                squiggleSpeed: 0.1,
                value: _currentValue,
                max: duration,
                label: Duration(microseconds: _currentValue.toInt()).toMinutesAndSeconds(),
                onChangeStart: (final newValue) {
                  _isSeeking = true;
                },
                onChanged: (final newValue) {
                  setState(() {
                    _currentValue = newValue;
                  });
                },
                onChangeEnd: (final newValue) {
                  bloc.add(PlayerEventSeekRequested(Duration(microseconds: newValue.toInt())));
                  Future.delayed(Durations.short4, () {
                    _isSeeking = false;
                  });
                },
              );
            },
          );
        },
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
