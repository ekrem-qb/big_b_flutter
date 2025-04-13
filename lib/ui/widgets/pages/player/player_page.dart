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
      create:
          (final context) => PlayerBloc(
            recordingId: recordingId,
            textLineId: textLineId,
            recording: recording,
          ),
      child: const PlayerView(),
    );
  }
}

class PlayerView extends StatelessWidget {
  const PlayerView({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocListener<PlayerBloc, PlayerState>(
      listenWhen:
          (final previous, final current) =>
              switch (previous.audioState) {
                StatusOfError(:final error) => error,
                _ => null,
              } !=
              switch (current.audioState) {
                StatusOfError(:final error) => error,
                _ => null,
              },
      listener: (final context, final state) {
        if (state.audioState case StatusOfError(:final error)) {
          showSnackbar(text: error.toString(), context: context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          systemOverlayStyle:
              Theme.of(context).brightness == Brightness.light
                  ? SystemUiOverlayStyle.dark
                  : SystemUiOverlayStyle.light,
          actions: const [_ViolationsButton(), SizedBox(width: 8)],
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
    final (bloc, isViolationsProcessed) = context.select(
      (final PlayerBloc bloc) => (
        bloc,
        switch (bloc.state.textState) {
          StatusOfData(data: PlayerTextStateTextAndViolations()) => true,
          _ => false,
        },
      ),
    );

    return ElevatedButton.icon(
      icon:
          isViolationsProcessed
              ? const Icon(Icons.report_outlined)
              : const Icon(Icons.cloud_sync),
      label:
          isViolationsProcessed
              ? const Text('İhlaller')
              : const Text('İhlaller aranıyor...'),
      onPressed:
          isViolationsProcessed
              ? () {
                final violations = switch (bloc.state.textState) {
                  StatusOfData(
                    data: PlayerTextStateTextAndViolations(
                      violations: StatusOfData(:final data),
                    ),
                  ) =>
                    data,
                  _ => null,
                };

                context.pushRoute(
                  ViolationsRoute(
                    id: bloc.state.recordingId,
                    violations: violations,
                    sortNewFirst: true,
                  ),
                );
              }
              : null,
    );
  }
}

class _Player extends StatelessWidget {
  const _Player();

  @override
  Widget build(final BuildContext context) {
    final (bloc, _) = context.select(
      (final PlayerBloc bloc) => (bloc, bloc.state.recordingState.runtimeType),
    );

    return switch (bloc.state.recordingState) {
      StatusOfLoading() => const Center(child: CircularProgressIndicator()),
      StatusOfError(:final error) => ErrorPanel(
        error: error.toString(),
        onRefresh: () => bloc.add(const PlayerEventLoadRequested()),
      ),
      StatusOfData() => CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.arrowUp):
              () => switch (bloc.state.textState) {
                StatusOfData(
                  data: PlayerTextStateOnlyText(:final currentTextLine) ||
                      PlayerTextStateTextAndViolations(:final currentTextLine),
                ) =>
                  bloc.add(PlayerEventJumpToLineRequested(currentTextLine - 1)),
                _ => null,
              },
          const SingleActivator(LogicalKeyboardKey.arrowDown):
              () => switch (bloc.state.textState) {
                StatusOfData(
                  data: PlayerTextStateOnlyText(:final currentTextLine) ||
                      PlayerTextStateTextAndViolations(:final currentTextLine),
                ) =>
                  bloc.add(PlayerEventJumpToLineRequested(currentTextLine + 1)),
                _ => null,
              },
          const SingleActivator(
                LogicalKeyboardKey.space,
                includeRepeats: false,
              ):
              () => bloc.add(const PlayerEventPlayPauseButtonPressed()),
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
                  children: [_Time(), _PlayButton(), _TotalTime()],
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
    final (bloc, _) = context.select(
      (final PlayerBloc bloc) => (bloc, bloc.state.textState.runtimeType),
    );

    final theme = Theme.of(context);

    return Expanded(
      child: AnimatedSwitcher(
        duration: Durations.medium1,
        transitionBuilder: fadeTransitionBuilder,
        child: switch (bloc.state.textState) {
          StatusOfLoading() => Shimmer.fromColors(
            baseColor:
                Color.lerp(
                  theme.colorScheme.onSurface,
                  theme.colorScheme.surfaceContainerLow,
                  0.85,
                )!,
            highlightColor: theme.colorScheme.onSurface,
            child: ShaderMask(
              shaderCallback: _gradient.createShader,
              blendMode: BlendMode.dstIn,
              child: LayoutBuilder(
                builder: (final context, final constraints) {
                  return ScrollablePositionedList.builder(
                    itemCount: 100,
                    padding: EdgeInsets.symmetric(
                      vertical: constraints.maxHeight * 0.5,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (final context, final index) {
                      return Align(
                        alignment:
                            index.isOdd
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Text(
                              'Hello' * (index + 1),
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          StatusOfError(:final error) => ErrorPanel(
            error: error.toString(),
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
    final (bloc, _) = context.select(
      (final PlayerBloc bloc) => (
        bloc,
        switch (bloc.state.textState) {
          StatusOfData(:final data) => data.runtimeType,
          _ => null,
        },
      ),
    );

    return switch (bloc.state.textState) {
      StatusOfData(:final data) => switch (data) {
        PlayerTextStateOnlyText() ||
        PlayerTextStateTextAndViolations() => ShaderMask(
          shaderCallback: _gradient.createShader,
          blendMode: BlendMode.dstIn,
          child: LayoutBuilder(
            builder: (final context, final constraints) {
              return PositionedSmoothMouseScroll(
                builder: (
                  final context,
                  final child,
                  final controller,
                  final physics,
                ) {
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
        PlayerTextStateNone() => const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cloud_sync_rounded, size: 64),
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

  bool _isApplyingNavigation = false;

  @override
  void initState() {
    _router = context.router;
    _router.addListener(_onRouteChanged);
    super.initState();
  }

  void _onRouteChanged() {
    if (_isApplyingNavigation) {
      _isApplyingNavigation = false;
      return;
    }

    final args = switch (_router.current.args) {
      final PlayerRouteArgs args => args,
      _ => null,
    };
    if (args == null) return;

    final bloc = context.read<PlayerBloc>();
    if (args.textLineId == bloc.state.currentTextLineId) return;

    final index = switch (bloc.state.textState) {
      StatusOfData(
        data: PlayerTextStateOnlyText(:final textLines) ||
            PlayerTextStateTextAndViolations(:final textLines),
      ) =>
        textLines.indexWhere(
          (final textLineWithHighlights) =>
              textLineWithHighlights.id == args.textLineId,
        ),
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
    final (count, currentIndex) = context.select((final PlayerBloc bloc) {
      return switch (bloc.state.textState) {
        StatusOfData(
          data: PlayerTextStateOnlyText(
                :final currentTextLine,
                :final textLines,
              ) ||
              PlayerTextStateTextAndViolations(
                :final currentTextLine,
                :final textLines,
              ),
        ) =>
          (textLines.length, currentTextLine),
        _ => (0, 0),
      };
    });

    return BlocListener<PlayerBloc, PlayerState>(
      listenWhen:
          (final previous, final current) =>
              switch (previous.textState) {
                StatusOfData(
                  data: PlayerTextStateOnlyText(:final currentTextLine) ||
                      PlayerTextStateTextAndViolations(:final currentTextLine),
                ) =>
                  currentTextLine,
                _ => null,
              } !=
              switch (current.textState) {
                StatusOfData(
                  data: PlayerTextStateOnlyText(:final currentTextLine) ||
                      PlayerTextStateTextAndViolations(:final currentTextLine),
                ) =>
                  currentTextLine,
                _ => null,
              },
      listener: (final context, final state) async {
        if (state.textState case StatusOfData(
          data: PlayerTextStateOnlyText(
                :final currentTextLine,
                :final textLines,
              ) ||
              PlayerTextStateTextAndViolations(
                :final currentTextLine,
                :final textLines,
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

          _isApplyingNavigation = true;
          await context.tabsRouter.navigate(
            PlayerRoute(
              recordingId: state.recordingId,
              textLineId: textLines[currentTextLine].id,
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
        padding: EdgeInsets.symmetric(
          vertical: widget.constraints.maxHeight * 0.5,
        ),
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
    final (bloc, isCurrent, isEmployee) = context.select((
      final PlayerBloc bloc,
    ) {
      return switch (bloc.state.textState) {
        StatusOfData(
          data: PlayerTextStateOnlyText(
                :final currentTextLine,
                :final textLines,
              ) ||
              PlayerTextStateTextAndViolations(
                :final currentTextLine,
                :final textLines,
              ),
        ) =>
          (
            bloc,
            currentTextLine == index,
            textLines.elementAtOrNull(index)?.isEmployee ?? false,
          ),
        _ => (bloc, false, false),
      };
    });

    return _TextLineContent(
      index: index,
      isEmployee: isEmployee,
      isCurrent: isCurrent,
      onTap: () => bloc.add(PlayerEventJumpToLineRequested(index)),
    );
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
            side:
                isCurrent
                    ? BorderSide(color: theme.colorScheme.primary, width: 2)
                    : BorderSide.none,
          ),
          color:
              isEmployee
                  ? null
                  : Color.lerp(
                    theme.colorScheme.surfaceContainer,
                    theme.colorScheme.primaryContainer,
                    0.5,
                  ),
          child: InkWell(
            borderRadius: kDefaultRadius,
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: _TextLineText(index: index),
            ),
          ),
        ),
      ),
    );
  }
}

class _TextLineText extends StatefulWidget {
  const _TextLineText({required this.index});

  final int index;

  @override
  State<_TextLineText> createState() => _TextLineTextState();
}

class _TextLineTextState extends State<_TextLineText> {
  final List<GestureRecognizer> _gestureRecognizers = [];

  TapGestureRecognizer _createRecognizer({required final Violation violation}) {
    final tapGestureRecognizer =
        TapGestureRecognizer()
          ..onTap = () {
            final violations = switch (context
                .read<PlayerBloc>()
                .state
                .textState) {
              StatusOfData(
                data: PlayerTextStateTextAndViolations(
                  violations: StatusOfData(:final data),
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
                  ViolationViewerRoute(id: violation.id, violation: violation),
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

  Iterable<InlineSpan> generateTextSpans(
    final String? text,
    final List<HighlightViolation>? highlights,
  ) sync* {
    if (text == null) return;

    if (highlights == null || highlights.isEmpty) {
      yield TextSpan(text: text);
      return;
    }

    var charIndex = 0;
    for (var i = 0; i < highlights.length; i++) {
      if (charIndex < highlights[i].startIndex) {
        final beforeHighlight = text.substring(
          charIndex,
          highlights[i].startIndex,
        );
        yield TextSpan(text: beforeHighlight);
      }

      final highlight = text.substring(
        highlights[i].startIndex,
        highlights[i].endIndex,
      );

      yield TextSpan(
        style: highlightedTextStyle(highlights[i].rule.color),
        text: highlight,
        recognizer: _createRecognizer(violation: highlights[i]),
      );

      charIndex = highlights[i].endIndex;
    }

    if (charIndex < text.length) {
      final afterHighlight = text.substring(charIndex);
      yield TextSpan(text: afterHighlight);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);

    final (textLine, highlights) = context.select((final PlayerBloc bloc) {
      return switch (bloc.state.textState) {
        StatusOfData(data: PlayerTextStateOnlyText(:final textLines)) => (
          textLines.elementAtOrNull(widget.index),
          null,
        ),
        StatusOfData(
          data: PlayerTextStateTextAndViolations(
            :final textLines,
            :final highlights,
          ),
        ) =>
          (
            textLines.elementAtOrNull(widget.index),
            highlights.elementAtOrNull(widget.index),
          ),
        _ => (null, null),
      };
    });

    try {
      return Text.rich(
        TextSpan(
          children: generateTextSpans(textLine?.text, highlights).toList(),
        ),
        style: theme.textTheme.bodyLarge,
      );
    } catch (e) {
      return Text(textLine?.text ?? '', style: theme.textTheme.bodyLarge);
    }
  }
}

class _Time extends StatelessWidget {
  const _Time();

  @override
  Widget build(final BuildContext context) {
    final position = context.select((final PlayerBloc bloc) {
      return switch (bloc.state.audioState) {
        StatusOfData(data: PlayerAudioState(:final position)) => position,
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
        StatusOfData(data: PlayerAudioState(:final duration)) => duration,
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
    final (bloc, canPlay, position, duration, isPlaying) = context.select((
      final PlayerBloc bloc,
    ) {
      return switch (bloc.state.audioState) {
        StatusOfData(
          data: PlayerAudioState(
            :final position,
            :final duration,
            :final isPlaying,
          ),
        ) =>
          (
            bloc,
            true,
            position.inMicroseconds.toDouble(),
            duration.inMicroseconds.toDouble(),
            isPlaying,
          ),
        _ => (bloc, false, 0.0, 0.0, false),
      };
    });

    return TweenAnimationBuilder(
      tween: Tween<double>(
        begin: _currentValue,
        end: !_didJump ? position : _currentValue,
      ),
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
          label:
              Duration(
                microseconds: _currentValue.toInt(),
              ).toMinutesAndSeconds(),
          onChangeStart: (final newValue) {
            _isSeeking = true;
          },
          onChanged:
              canPlay
                  ? (final newValue) {
                    setState(() {
                      _currentValue = newValue;
                    });
                  }
                  : null,
          onChangeEnd: (final newValue) {
            _didJump = true;
            bloc.add(
              PlayerEventSeekRequested(
                Duration(microseconds: newValue.toInt()),
              ),
            );
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
    final (bloc, _) = context.select(
      (final PlayerBloc bloc) => (bloc, bloc.state.audioState.runtimeType),
    );

    return bloc.state.audioState is! StatusOfLoading
        ? IconButton.filled(
          visualDensity: const VisualDensity(horizontal: 2, vertical: 2),
          onPressed:
              bloc.state.audioState is StatusOfData
                  ? () => bloc.add(const PlayerEventPlayPauseButtonPressed())
                  : null,
          icon: const _PlayButtonIcon(),
        )
        : const IconButton.filled(
          visualDensity: VisualDensity(horizontal: 2, vertical: 2),
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
    final isPlaying = context.select((final PlayerBloc bloc) {
      return switch (bloc.state.audioState) {
        StatusOfData(data: PlayerAudioState(:final isPlaying)) => isPlaying,
        _ => false,
      };
    });

    return Icon(isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded);
  }
}
