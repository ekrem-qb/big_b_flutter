import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import 'recordings_model.dart';

@RoutePage()
class RecordingsPage extends StatelessWidget {
  const RecordingsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: Recordings.new,
      child: const _RecordingsList(),
    );
  }
}

class _RecordingsList extends StatelessWidget {
  const _RecordingsList();

  @override
  Widget build(final BuildContext context) {
    late final Recordings model;
    var isInitialized = false;
    context.select((final Recordings newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.isLoading;
    });

    return model.isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : const _RecordingsListContent();
  }
}

class _RecordingsListContent extends StatelessWidget {
  const _RecordingsListContent();

  @override
  Widget build(final BuildContext context) {
    late final Recordings model;
    var isInitialized = false;
    context.select((final Recordings newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.recordings.length;
    });

    return model.recordings.isEmpty
        ? const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.sentiment_very_dissatisfied,
                  size: 64,
                ),
                Text('Kayıtlar bulunamadı'),
              ],
            ),
          )
        : SmoothMouseScroll(
            builder: (final context, final child, final controller, final physics) {
              return ListView.builder(
                controller: controller,
                physics: physics,
                itemBuilder: _Item.new,
                itemCount: model.recordings.length,
              );
            },
          );
  }
}

class _Item extends StatelessWidget {
  const _Item(final BuildContext _, this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    late final Recordings model;
    var isInitialized = false;
    context.select((final Recordings newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.recordings.elementAtOrNull(index);
    });

    return Card(
      child: model.recordings.length >= index
          ? ListTile(
              title: Text(
                model.recordings[index].createdAt.toString(),
              ),
              trailing: SizedBox.square(
                dimension: 24,
                child: !model.recordings[index].hasLines
                    ? const Icon(
                        Icons.font_download_off_outlined,
                        size: 24,
                      )
                    : null,
              ),
              onTap: () => model.open(index),
            )
          : const _DeletedItemContent(),
    );
  }
}

class _DeletedItemContent extends StatelessWidget {
  const _DeletedItemContent();

  @override
  Widget build(final BuildContext context) {
    return const ListTile(
      mouseCursor: SystemMouseCursors.click,
      title: Text(
        'Silinmiş',
        style: TextStyle(color: Colors.red),
      ),
      trailing: SizedBox.square(
        dimension: 24,
      ),
    );
  }
}
