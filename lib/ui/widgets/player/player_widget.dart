import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../api/entity/recording/recording.dart';
import '../../../constants.dart';
import '../extensions/separator.dart';
import '../extensions/smooth_scroll/positioned_smooth_scroll.dart';
import 'player_model.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({
    required this.recording,
    super.key,
  });

  final Recording recording;

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: (final context) => Player(context, recording: recording),
      child: Scaffold(
        appBar: AppBar(),
        body: const _Player(),
      ),
    );
  }
}

class _Player extends StatelessWidget {
  const _Player();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<Player>();

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.arrowUp): () => model.jumpToLine(model.currentTextLine - 1),
        const SingleActivator(LogicalKeyboardKey.arrowDown): () => model.jumpToLine(model.currentTextLine + 1),
        const SingleActivator(LogicalKeyboardKey.space, includeRepeats: false): model.play,
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
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

  Widget _item(final Player model, final int index) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (final _) => model.jumpToLine(index),
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
    late final Player model;
    var isInitialized = false;
    context.select((final Player newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.textSpans;
    });

    return Expanded(
      child: model.textSpans != null
          ? ShaderMask(
              shaderCallback: _gradient.createShader,
              blendMode: BlendMode.dstIn,
              child: isDesktop
                  ? PositionedSmoothScroll(
                      controller: model.offsetController,
                      child: ScrollablePositionedList.separated(
                        itemScrollController: model.scrollController,
                        scrollOffsetController: model.offsetController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: model.textSpans!.length,
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.5),
                        separatorBuilder: separatorBuilder,
                        itemBuilder: (final context, final index) => _item(model, index),
                      ),
                    )
                  : ScrollablePositionedList.separated(
                      itemScrollController: model.scrollController,
                      scrollOffsetController: model.offsetController,
                      itemCount: model.textSpans!.length,
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.5),
                      separatorBuilder: separatorBuilder,
                      itemBuilder: (final context, final index) => _item(model, index),
                    ),
            )
          : const Center(
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
    );
  }
}

class _TextLine extends StatelessWidget {
  const _TextLine({required this.index});

  final int index;

  @override
  Widget build(final BuildContext context) {
    late final Player model;
    var isInitialized = false;
    context.select((final Player newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.currentTextLine;
    });

    return model.currentTextLine != index
        ? Opacity(
            opacity: 0.5,
            child: Text.rich(
              model.textSpans![index],
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          )
        : Text.rich(
            model.textSpans![index],
            style: Theme.of(context).textTheme.headlineSmall,
          );
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
    late final Player model;
    var isInitialized = false;
    context.select((final Player newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.position;
    });

    return Text(_formatTime(model.position));
  }
}

class _TotalTime extends StatelessWidget {
  const _TotalTime();

  @override
  Widget build(final BuildContext context) {
    late final Player model;
    var isInitialized = false;
    context.select((final Player newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.duration;
    });

    return Text(_formatTime(model.duration));
  }
}

class _Slider extends StatelessWidget {
  const _Slider();

  @override
  Widget build(final BuildContext context) {
    late final Player model;
    var isInitialized = false;
    context.select((final Player newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.position;
    });

    return MediaQuery(
      data: const MediaQueryData(navigationMode: NavigationMode.directional),
      child: Slider(
        max: model.duration.inMilliseconds.toDouble(),
        value: model.position.inMilliseconds.toDouble(),
        onChangeStart: (final _) => model.isSeeking = true,
        onChanged: (final newValue) => model.position = Duration(milliseconds: newValue.toInt()),
        onChangeEnd: (final newValue) => model.seek(Duration(milliseconds: newValue.toInt())),
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(final BuildContext context) {
    late final Player model;
    var isInitialized = false;
    context.select((final Player newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.isAudioLoaded;
    });

    return model.isAudioLoaded != null
        ? IconButton.filled(
            visualDensity: const VisualDensity(
              horizontal: 2,
              vertical: 2,
            ),
            onPressed: model.isAudioLoaded! ? model.play : null,
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
    late final Player model;
    var isInitialized = false;
    context.select((final Player newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.isPlaying;
    });

    return Icon(
      model.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
    );
  }
}
