import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/entity/profile/profile.dart';
import '../../../../api/enums/role.dart';
import '../../../entity/status.dart';
import '../../../theme.dart';
import '../../error_panel.dart';
import 'bloc/profile_picker_bloc.dart';

Future<List<Profile>> showProfilesPicker(final BuildContext context, {required final List<Profile> excluded}) async {
  final profiles = await showCupertinoModalPopup<List<Profile>>(
    context: context,
    builder: (final context) {
      return _ProfilePickerDialog(excluded);
    },
  );

  return profiles ?? const [];
}

class _ProfilePickerDialog extends StatelessWidget {
  const _ProfilePickerDialog(this._excluded);

  final List<Profile> _excluded;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => ProfilePickerBloc(excluded: _excluded),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Flexible(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: FractionallySizedBox(
                heightFactor: 0.5,
                child: CupertinoPopupSurface(
                  child: _Profiles(),
                ),
              ),
            ),
          ),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: const CupertinoActionSheet(
              actions: [
                _Ok(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Profiles extends StatelessWidget {
  const _Profiles();

  @override
  Widget build(final BuildContext context) {
    final (
      bloc,
      _,
    ) = context.select(
      (final ProfilePickerBloc bloc) => (
        bloc,
        bloc.state.all.runtimeType,
      ),
    );

    return switch (bloc.state.all) {
      StatusOfData<List<Profile>>(
        :final data,
      ) =>
        data.isEmpty
            ? const Material(
                color: Colors.transparent,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person, size: 64),
                      Text('Başka çalışan yok'),
                    ],
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: data.length,
                itemBuilder: (final BuildContext context, final int index) => _Profile(index),
              ),
      StatusOfLoading<List<Profile>>() => const Center(child: CircularProgressIndicator()),
      StatusOfError<List<Profile>>(
        :final error,
      ) =>
        ErrorPanel(
          error: error,
          onRefresh: () => bloc.add(const ProfilePickerEventLoadRequested()),
        ),
    };
  }
}

class _Profile extends StatelessWidget {
  const _Profile(this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    final (
      bloc,
      isSelected,
    ) = context.select(
      (final ProfilePickerBloc bloc) => (
        bloc,
        switch (bloc.state.all) {
          StatusOfData<List<Profile>>(
            :final data,
          ) =>
            bloc.state.selected.contains(data[index]),
          _ => false,
        },
      ),
    );

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultRadius,
        side: isSelected
            ? BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              )
            : BorderSide.none,
      ),
      child: switch (bloc.state.all) {
        StatusOfData<List<Profile>>(
          :final data,
        ) =>
          ListTile(
            leading: Icon(data[index].role == Role.manager ? Icons.security : Icons.person),
            title: Text(data[index].name),
            selected: isSelected,
            trailing: AnimatedOpacity(
              opacity: isSelected ? 1 : 0,
              curve: Curves.easeInOutExpo,
              duration: Durations.medium1,
              child: AnimatedScale(
                scale: isSelected ? 1 : 0,
                curve: Curves.easeInOutExpo,
                duration: Durations.medium1,
                child: const Icon(Icons.check_circle),
              ),
            ),
            onTap: () => isSelected ? bloc.add(ProfilePickerEventDeselected(index)) : bloc.add(ProfilePickerEventSelected(index)),
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

class _Ok extends StatelessWidget {
  const _Ok();

  @override
  Widget build(final BuildContext context) {
    final bloc = context.read<ProfilePickerBloc>();

    return CupertinoActionSheetAction(
      isDefaultAction: true,
      onPressed: () => Navigator.of(context).pop(bloc.state.selected),
      child: const Text('OK'),
    );
  }
}
