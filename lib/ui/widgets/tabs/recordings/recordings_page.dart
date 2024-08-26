import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../api/entity/recording/recording.dart';
import '../../../app_router/app_router.dart';
import '../../lister/lister_widget.dart';
import 'recordings_bloc.dart';

@RoutePage()
class RecordingsPage extends StatelessWidget {
  const RecordingsPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kayıtlar'),
      ),
      body: const Lister<RecordingsBloc, Recording>(
        blocCreator: RecordingsBloc.new,
        itemContentBuilder: _Item.new,
        noItemsIcon: Icons.mic,
        noItemsText: 'Kayıtlar bulunamadı',
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.recording);

  final Recording recording;

  @override
  Widget build(final BuildContext context) {
    return ListTile(
      title: Text(
        recording.createdAt.toString(),
      ),
      subtitle: Text(
        recording.employee.name,
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
    );
  }
}
