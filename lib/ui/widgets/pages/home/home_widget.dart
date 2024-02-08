import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../api/recording.dart';
import '../../../../constants.dart';
import '../../extensions/smooth_scroll/smooth_scroll_widget.dart';
import '../../player/player_widget.dart';
import 'home_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: Home.new,
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            _LogoutButton(),
          ],
          elevation: 4,
        ),
        body: const Row(
          children: [
            Flexible(
              child: _RecordingsList(),
            ),
            VerticalDivider(width: 1),
            Flexible(
              flex: 2,
              child: _Player(),
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<Home>();

    return ElevatedButton(
      onPressed: model.logout,
      child: const Text('Çıkış'),
    );
  }
}

class _Player extends StatelessWidget {
  const _Player();

  @override
  Widget build(final BuildContext context) {
    late final Home model;
    var isInitialized = false;
    context.select<Home, int?>((final newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.selectedRecordingIndex;
    });

    return model.selectedRecordingIndex != null
        ? PlayerWidget(
            recording: model.recordings![model.selectedRecordingIndex!],
            key: ValueKey(model.selectedRecordingIndex!),
          )
        : const Center(
            child: Text(
              'Select recording on the left',
              style: TextStyle(fontSize: 32),
            ),
          );
  }
}

class _RecordingsList extends StatelessWidget {
  const _RecordingsList();

  @override
  Widget build(final BuildContext context) {
    late final Home model;
    var isInitialized = false;
    context.select<Home, List<Recording>?>((final newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.recordings;
    });

    if (model.recordings == null) {
      return const Center(
        child: Text('No recordings'),
      );
    }

    return isDesktop
        ? SmoothScroll(
            controller: model.scrollController,
            child: ListView.builder(
              controller: model.scrollController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (final context, final index) => _Item(index: index),
              itemCount: model.recordings!.length,
            ),
          )
        : ListView.builder(
            controller: model.scrollController,
            itemBuilder: (final context, final index) => _Item(index: index),
            itemCount: model.recordings!.length,
          );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.index});

  final int index;

  @override
  Widget build(final BuildContext context) {
    late final Home model;
    var isInitialized = false;
    context.select<Home, int?>((final newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.selectedRecordingIndex;
    });

    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: model.selectedRecordingIndex == index ? Theme.of(context).focusColor : Colors.transparent,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: InkWell(
        onTap: () => model.selectedRecordingIndex = index,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: ListTile(
          mouseCursor: SystemMouseCursors.click,
          title: Text(
            'Recording $index',
          ),
        ),
      ),
    );
  }
}
