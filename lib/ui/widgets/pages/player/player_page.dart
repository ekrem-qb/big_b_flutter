import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../api/entity/recording/recording.dart';
import '../../../../constants.dart';
import '../../extensions/mouse_navigator.dart';
import '../../extensions/separator.dart';
import '../../extensions/smooth_scroll/positioned_smooth_scroll.dart';
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
      listenWhen: (final previous, final current) => previous.error != current.error || previous.audioState.runtimeType != current.audioState.runtimeType || previous.textState.runtimeType != current.textState.runtimeType,
      listener: (final context, final state) {
        final error = state.error;
        if (error != null) {
          showSnackbar(text: error, context: context);
          Navigator.of(context).pop();
          return;
        }
        final audioState = state.audioState;
        if (audioState is PlayerAudioStateError) {
          showSnackbar(text: audioState.error, context: context);
          return;
        }
        final textState = state.textState;
        if (textState is PlayerTextStateError) {
          showSnackbar(text: textState.error, context: context);
          return;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
        ),
        body: const _Player(),
      ),
    );
  }
}

class _Player extends StatelessWidget {
  const _Player();

  @override
  Widget build(final BuildContext context) {
    final bloc = context.read<PlayerBloc>();

    return CallbackShortcuts(
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
          mainAxisSize: MainAxisSize.min,
          children: [
            _Text(),
            _Slider(),
            _Time(),
            _PlayButton(),
          ],
        ),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

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

  static const _gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Color(0xbfffffff),
      Colors.white,
      Color(0xbfffffff),
      Colors.transparent,
    ],
    stops: [
      0,
      0.25,
      0.5,
      0.75,
      1,
    ],
  );

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

    return Expanded(
      child: switch (bloc.state.textState) {
        PlayerTextStateData(
          :final textSpans,
        ) =>
          ShaderMask(
            shaderCallback: _gradient.createShader,
            blendMode: BlendMode.dstIn,
            child: LayoutBuilder(
              builder: (final context, final constraints) {
                return isDesktop
                    ? PositionedSmoothScroll(
                        controller: bloc.offsetController,
                        child: ScrollablePositionedList.separated(
                          itemScrollController: bloc.scrollController,
                          scrollOffsetController: bloc.offsetController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: textSpans.length,
                          padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.5),
                          separatorBuilder: separatorBuilder,
                          itemBuilder: (final context, final index) => _item(bloc, index),
                        ),
                      )
                    : ScrollablePositionedList.separated(
                        itemScrollController: bloc.scrollController,
                        scrollOffsetController: bloc.offsetController,
                        itemCount: textSpans.length,
                        padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.5),
                        separatorBuilder: separatorBuilder,
                        itemBuilder: (final context, final index) => _item(bloc, index),
                      );
              },
            ),
          ),
        PlayerTextStateLoading() => const Center(
            child: CircularProgressIndicator(),
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
        PlayerTextStateError() => const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline_rounded,
                  size: 64,
                ),
                SizedBox(height: 36),
                Text(
                  'Hata oluştu',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
      },
    );
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
      PlayerTextStateData(
        :final currentTextLine,
        :final textSpans,
      ) =>
        currentTextLine != index
            ? Opacity(
                opacity: 0.5,
                child: Text.rich(
                  textSpans[index],
                  style: textStyle,
                ),
              )
            : Text.rich(
                textSpans[index],
                style: textStyle,
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
        PlayerAudioStateData(
          :final position,
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
        PlayerAudioStateData(
          :final duration,
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
          PlayerAudioStateData(
            :final position
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
        PlayerAudioStateData(
          :final position,
          :final duration,
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

    return bloc.state.audioState is! PlayerAudioStateLoading
        ? IconButton.filled(
            visualDensity: const VisualDensity(
              horizontal: 2,
              vertical: 2,
            ),
            onPressed: bloc.state.audioState is PlayerAudioStateData ? () => bloc.add(const PlayerEventPlayPauseButtonPressed()) : null,
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
        PlayerAudioStateData(
          :final isPlaying,
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
