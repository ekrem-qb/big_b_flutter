import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../constants.dart';
import '../positioned_smooth_scroll.dart';
import '../text_line.dart';
import 'player_model.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: (final context) => Home(),
      child: const Scaffold(
        body: Center(
          child: Padding(
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
        ),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text();

  Widget _separator(final BuildContext context, final int index) => const Divider(height: 1);

  Widget _item(final Home model, final int index) {
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

  Shader _shader(final rect) {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.transparent,
        Colors.white.withOpacity(0.75),
        Colors.white,
        Colors.white.withOpacity(0.75),
        Colors.transparent,
      ],
      stops: const [
        0,
        0.25,
        0.5,
        0.75,
        1,
      ],
    ).createShader(rect);
  }

  @override
  Widget build(final BuildContext context) {
    late final Home model;
    var isInitialized = false;
    context.select<Home, List<TextLine>?>((final newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.textLines;
    });

    return Expanded(
      child: model.textLines != null
          ? ShaderMask(
              shaderCallback: _shader,
              blendMode: BlendMode.dstIn,
              child: isDesktop
                  ? PositionedSmoothScroll(
                      controller: model.offsetController,
                      child: ScrollablePositionedList.separated(
                        itemScrollController: model.scrollController,
                        scrollOffsetController: model.offsetController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: model.textLines!.length,
                        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.5),
                        separatorBuilder: _separator,
                        itemBuilder: (final context, final index) => _item(model, index),
                      ),
                    )
                  : ScrollablePositionedList.separated(
                      itemScrollController: model.scrollController,
                      scrollOffsetController: model.offsetController,
                      itemCount: model.textLines!.length,
                      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.5),
                      separatorBuilder: _separator,
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
    late final Home model;
    var isInitialized = false;
    context.select<Home, int>((final newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.currentTextLine;
    });

    return Text(
      model.textLines![index].content,
      style: TextStyle(
        color: model.currentTextLine == index ? Theme.of(context).colorScheme.primary : null,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
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
    late final Home model;
    var isInitialized = false;
    context.select<Home, Duration>((final newModel) {
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
    late final Home model;
    var isInitialized = false;
    context.select<Home, Duration>((final newModel) {
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
    late final Home model;
    var isInitialized = false;
    context.select<Home, Duration>((final newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.position;
    });

    return Slider(
      max: model.duration.inMilliseconds.toDouble(),
      value: model.position.inMilliseconds.toDouble(),
      onChangeStart: (final _) => model.isSeeking = true,
      onChanged: (final newValue) => model.position = Duration(milliseconds: newValue.toInt()),
      onChangeEnd: (final newValue) => model.seek(Duration(milliseconds: newValue.toInt())),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(final BuildContext context) {
    late final Home model;
    var isInitialized = false;
    context.select<Home, bool>((final newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.isPlaying;
    });

    return FloatingActionButton(
      onPressed: model.play,
      child: Icon(
        model.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
      ),
    );
  }
}
