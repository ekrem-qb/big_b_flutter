import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_router/app_router.dart';
import '../../error_panel.dart';
import '../../extensions/fade_transition_builder.dart';
import '../../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import '../../list_view_shimmer.dart';
import 'bloc/recordings_bloc.dart';

@RoutePage()
class RecordingsPage extends StatelessWidget {
  const RecordingsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => RecordingsBloc(),
      child: const RecordingsView(),
    );
  }
}

class RecordingsView extends StatelessWidget {
  const RecordingsView({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kayıtlar'),
      ),
      body: const _RecordingsList(),
    );
  }
}

class _RecordingsList extends StatelessWidget {
  const _RecordingsList();

  @override
  Widget build(final BuildContext context) {
    late final RecordingsBloc bloc;
    var isInitialized = false;
    context.select((final RecordingsBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return bloc.state.runtimeType;
    });

    return AnimatedSwitcher(
      duration: Durations.medium1,
      transitionBuilder: fadeTransitionBuilder,
      child: switch (bloc.state) {
        RecordingsStateLoading() => const ListViewShimmer(),
        RecordingsStateError(
          :final error
        ) =>
          ErrorPanel(
            error: error,
            onRefresh: () => bloc.add(const RecordingsEventLoadRequested()),
          ),
        RecordingsStateData() => const _RecordingsListContent(),
      },
    );
  }
}

class _RecordingsListContent extends StatelessWidget {
  const _RecordingsListContent();

  @override
  Widget build(final BuildContext context) {
    final count = context.select((final RecordingsBloc bloc) {
      return switch (bloc.state) {
        RecordingsStateData(
          :final recordings
        ) =>
          recordings.length,
        _ => 0,
      };
    });

    return count == 0
        ? const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.mic,
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
                itemCount: count,
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
    final recording = context.select((final RecordingsBloc bloc) {
      return switch (bloc.state) {
        RecordingsStateData(
          :final recordings,
        ) =>
          recordings.elementAtOrNull(index),
        _ => null,
      };
    });

    return Card(
      child: recording != null
          ? ListTile(
              title: Text(
                recording.createdAt.toString(),
              ),
              trailing: SizedBox.square(
                dimension: 24,
                child: !recording.hasLines
                    ? const Icon(
                        Icons.font_download_off_outlined,
                        size: 24,
                      )
                    : null,
              ),
              onTap: () => context.router.push(
                PlayerRoute(
                  id: recording.id,
                  recording: recording,
                ),
              ),
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
