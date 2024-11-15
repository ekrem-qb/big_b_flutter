import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../api/entity/recording/recording.dart';
import '../../../../api/entity/violation/violation.dart';
import '../../../../extensions/duration.dart';
import '../../../app_router/app_router.dart';
import '../../../entity/status.dart';
import '../../../theme.dart';
import '../../error_panel.dart';
import '../../extensions/fade_transition_builder.dart';
import '../../extensions/shimmer.dart';
import '../../extensions/smooth_mouse_scroll/positioned_smooth_mouse_scroll.dart';
import '../../extensions/snackbar.dart';
import 'bloc/player_bloc.dart';

const animationDuration = Durations.short4;
const animationCurve = Curves.easeOutExpo;

@RoutePage()
class PlayerPage extends StatelessWidget {
  const PlayerPage({
    @pathParam required this.recordingId,
    @pathParam this.textLineId,
    this.recording,
    super.key,
  });

  final int recordingId;
  final int? textLineId;
  final Recording? recording;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      key: ValueKey(recordingId),
      create: (final context) => PlayerBloc(
        recordingId: recordingId,
        textLineId: textLineId,
        recording: recording,
      ),
      child: const PlayerView(),
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
        final id = context.read<PlayerBloc>().state.recordingId;

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
                blendMode: BlendMode.dstIn,
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

class _LoadedText extends StatelessWidget {
  const _LoadedText();

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
          PlayerTextStateData() => ShaderMask(
              shaderCallback: _gradient.createShader,
              blendMode: BlendMode.dstIn,
              child: LayoutBuilder(
                builder: (final context, final constraints) {
                  return PositionedSmoothMouseScroll(
                    builder: (final context, final child, final controller, final physics) {
                      return _TextList(
                        constraints: constraints,
                        scrollOffsetController: controller,
                        physics: physics,
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

class _TextList extends StatefulWidget {
  const _TextList({
    required this.constraints,
    required this.scrollOffsetController,
    this.physics,
  });

  final BoxConstraints constraints;
  final ScrollOffsetController scrollOffsetController;
  final ScrollPhysics? physics;

  @override
  State<_TextList> createState() => _TextListState();
}

class _TextListState extends State<_TextList> {
  final _scrollController = ItemScrollController();
  late final StackRouter _router;

  @override
  void initState() {
    _router = context.router;
    _router.addListener(_onRouteChanged);
    super.initState();
  }

  void _onRouteChanged() {
    final args = switch (_router.current.args) {
      final PlayerRouteArgs args => args,
      _ => null,
    };
    if (args == null) return;

    final bloc = context.read<PlayerBloc>();
    if (args.textLineId == bloc.state.currentTextLineId) return;

    final index = switch (bloc.state.textState) {
      StatusOfData(
        data: PlayerTextStateData(
          :final textLinesWithHighlights,
        ),
      ) =>
        textLinesWithHighlights.indexWhere((final textLineWithHighlights) => textLineWithHighlights.$1.id == args.textLineId),
      _ => -1,
    };

    if (index == -1) return;

    bloc.add(PlayerEventJumpToLineRequested(index));
  }

  @override
  void dispose() {
    _router.removeListener(_onRouteChanged);
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    late final PlayerBloc bloc;
    var isInitialized = false;
    final count = context.select((final PlayerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state.textState) {
        StatusOfData(
          data: PlayerTextStateData(
            :final textLinesWithHighlights,
          )
        ) =>
          textLinesWithHighlights.length,
        _ => 0,
      };
    });
    final currentIndex = switch (bloc.state.textState) {
      StatusOfData(
        data: PlayerTextStateData(
          :final currentTextLine,
        )
      ) =>
        currentTextLine,
      _ => 0,
    };

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
                :final textLinesWithHighlights,
              ),
            )) {
          if (_scrollController.isAttached) {
            await _scrollController.scrollTo(
              index: currentTextLine,
              alignment: 0.5,
              duration: scrollDuration,
              curve: scrollCurve,
            );
          }

          await context.tabsRouter.navigate(
            PlayerRoute(
              recordingId: state.recordingId,
              textLineId: textLinesWithHighlights[currentTextLine].$1.id,
            ),
          );
        }
      },
      child: ScrollablePositionedList.builder(
        itemScrollController: _scrollController,
        scrollOffsetController: widget.scrollOffsetController,
        initialScrollIndex: currentIndex,
        initialAlignment: currentIndex != 0 ? 0.5 : 0,
        physics: widget.physics,
        itemCount: count,
        padding: EdgeInsets.symmetric(vertical: widget.constraints.maxHeight * 0.5),
        itemBuilder: _TextLine.new,
      ),
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
    final (
      isCurrent,
      isEmployee,
    ) = context.select((final PlayerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }

      return switch (bloc.state.textState) {
        StatusOfData(
          data: PlayerTextStateData(
            :final currentTextLine,
            :final textLinesWithHighlights,
          )
        ) =>
          (
            currentTextLine == index,
            textLinesWithHighlights.elementAtOrNull(index)?.$1.isEmployee ?? false,
          ),
        _ => (
            false,
            false,
          ),
      };
    });

    return switch (bloc.state.textState) {
      StatusOfData(
        data: PlayerTextStateData(),
      ) =>
        _TextLineContent(
          index: index,
          isEmployee: isEmployee,
          isCurrent: isCurrent,
          onTap: () => bloc.add(PlayerEventJumpToLineRequested(index)),
        ),
      _ => const SizedBox.shrink()
    };
  }
}

class _TextLineContent extends StatelessWidget {
  const _TextLineContent({
    required this.index,
    required this.isEmployee,
    required this.isCurrent,
    required this.onTap,
  });

  final int index;
  final bool isEmployee;
  final bool isCurrent;
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
          shape: RoundedRectangleBorder(
            borderRadius: kDefaultRadius,
            side: isCurrent
                ? BorderSide(
                    color: theme.colorScheme.primary,
                    width: 2,
                  )
                : BorderSide.none,
          ),
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
              child: _TextLineText(
                index: index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TextLineText extends StatefulWidget {
  const _TextLineText({
    required this.index,
  });

  final int index;

  @override
  State<_TextLineText> createState() => _TextLineTextState();
}

class _TextLineTextState extends State<_TextLineText> {
  final List<GestureRecognizer> _gestureRecognizers = [];

  TapGestureRecognizer _createRecognizer({required final Violation violation}) {
    final tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
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
        context.router.push(
          ViolationsRoute(
            id: violation.record.id,
            violations: violations,
            children: [
              ViolationViewerRoute(
                id: violation.id,
                violation: violation,
              ),
            ],
          ),
        );
      };
    _gestureRecognizers.add(tapGestureRecognizer);
    return tapGestureRecognizer;
  }

  @override
  void dispose() {
    for (var i = 0; i < _gestureRecognizers.length; i++) {
      _gestureRecognizers[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);

    late final PlayerBloc bloc;
    var isInitialized = false;
    final textLineWithHighlights = context.select((final PlayerBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state.textState) {
        StatusOfData(
          data: PlayerTextStateData(
            :final textLinesWithHighlights,
          )
        ) =>
          textLinesWithHighlights.elementAtOrNull(widget.index),
        _ => (
            null,
            List<HighlightViolation>.empty(),
          ),
      };
    });

    Iterable<InlineSpan> generateTextSpans() sync* {
      if (textLineWithHighlights == null) return;

      final (
        textLine,
        highlights
      ) = textLineWithHighlights;
      if (textLine == null) return;

      var charIndex = 0;
      for (var j = 0; j < highlights.length; j += 2) {
        if (charIndex < highlights[j].startIndex) {
          final substring = textLine.text.substring(charIndex, highlights[j].startIndex);
          yield TextSpan(text: substring);
        }

        final substring2 = textLine.text.substring(highlights[j].startIndex, highlights[j].endIndex);
        final isLight = ThemeData.estimateBrightnessForColor(highlights[j].rule.color) == Brightness.light;

        yield TextSpan(
          style: TextStyle(
            color: isLight ? Colors.black : Colors.white,
            backgroundColor: highlights[j].rule.color,
          ),
          text: substring2,
          recognizer: _createRecognizer(violation: highlights[j]),
        );

        charIndex = highlights[j].endIndex;
      }

      if (charIndex < textLine.text.length) {
        final substring = textLine.text.substring(charIndex);
        yield TextSpan(text: substring);
      }
    }

    return Text.rich(
      TextSpan(children: generateTextSpans().toList()),
      style: theme.textTheme.bodyLarge,
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
  bool _didJump = false;
  double _currentValue = 0;

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

    return TweenAnimationBuilder(
      tween: Tween<double>(begin: _currentValue, end: !_didJump ? position : _currentValue),
      curve: isPlaying ? Curves.linear : animationCurve,
      duration: animationDuration,
      onEnd: () {
        if (_didJump) {
          _isSeeking = false;
          _didJump = false;
        }
      },
      builder: (final context, final value, final child) {
        if (!_isSeeking) {
          _currentValue = value;
        }

        return Slider(
          value: _currentValue,
          max: duration,
          label: Duration(microseconds: _currentValue.toInt()).toMinutesAndSeconds(),
          onChangeStart: (final newValue) {
            _isSeeking = true;
          },
          onChanged: bloc.state.audioState is StatusOfData<PlayerAudioState>
              ? (final newValue) {
                  setState(() {
                    _currentValue = newValue;
                  });
                }
              : null,
          onChangeEnd: (final newValue) {
            _didJump = true;
            bloc.add(PlayerEventSeekRequested(Duration(microseconds: newValue.toInt())));
          },
        );
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
