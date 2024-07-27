import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../api/entity/profile/profile.dart';
import '../../../../api/enums/role.dart';
import '../../extensions/mouse_navigator.dart';
import 'profile_picker_model.dart';

Future<List<Profile>> showProfilesPicker(final BuildContext context, {final List<Profile>? excluded}) async {
  final profiles = await showCupertinoModalPopup<List<Profile>>(
    context: context,
    builder: (final context) {
      return _ProfilePickerDialog(excluded);
    },
  );

  return profiles ?? List.empty();
}

class _ProfilePickerDialog extends StatelessWidget {
  const _ProfilePickerDialog(this._excluded);

  final List<Profile>? _excluded;

  @override
  Widget build(final BuildContext context) {
    return MouseNavigator(
      child: ChangeNotifierProvider(
        create: (final context) => ProfilePicker(context, _excluded),
        builder: (final context, final child) {
          return Column(
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
          );
        },
      ),
    );
  }
}

class _Profiles extends StatelessWidget {
  const _Profiles();

  @override
  Widget build(final BuildContext context) {
    late final ProfilePicker model;
    var isInitialized = false;
    context.select((final ProfilePicker newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.isLoading;
    });

    return model.isLoading
        ? const Center(child: CircularProgressIndicator())
        : model.all.isEmpty
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
                itemCount: model.all.length,
                itemBuilder: (final BuildContext context, final int index) => _Profile(index),
              );
  }
}

class _Profile extends StatelessWidget {
  const _Profile(this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    late final ProfilePicker model;
    var isInitialized = false;
    final isSelected = context.select((final ProfilePicker newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.isSelected(index);
    });

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        side: isSelected
            ? BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              )
            : BorderSide.none,
      ),
      child: ListTile(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        leading: Icon(model.all[index].role == Role.manager ? Icons.security : Icons.person),
        title: Text(model.all[index].name),
        selected: isSelected,
        trailing: AnimatedOpacity(
          opacity: isSelected ? 1 : 0,
          curve: Curves.easeInOutExpo,
          duration: const Duration(milliseconds: 250),
          child: AnimatedScale(
            scale: isSelected ? 1 : 0,
            curve: Curves.easeInOutExpo,
            duration: const Duration(milliseconds: 250),
            child: const Icon(Icons.check_circle),
          ),
        ),
        onTap: () => isSelected ? model.unselect(index) : model.select(index),
      ),
    );
  }
}

class _Ok extends StatelessWidget {
  const _Ok();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<ProfilePicker>();

    return CupertinoActionSheetAction(
      isDefaultAction: true,
      onPressed: model.ok,
      child: const Text('OK'),
    );
  }
}
