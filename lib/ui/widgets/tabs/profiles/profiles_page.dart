import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../api/entity/profile/profile.dart';
import '../../../../api/enums/role.dart';
import '../../../app_router/app_router.dart';
import '../../lister/lister_widget.dart';
import 'profiles_bloc.dart';

@RoutePage()
class ProfilesPage extends StatelessWidget {
  const ProfilesPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Çalışanlar'),
      ),
      body: const Lister<ProfilesBloc, Profile>.cards(
        blocCreator: ProfilesBloc.new,
        itemContentBuilder: _Item.new,
        noItemsIcon: Icons.person,
        noItemsText: 'Çalışan bulunamadı',
      ),
      floatingActionButton: const _NewProfileButton(),
    );
  }
}

class _NewProfileButton extends StatelessWidget {
  const _NewProfileButton();

  @override
  Widget build(final BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.pushRoute(const NewProfileEditorRoute()),
      child: const Icon(Icons.add),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.profile);

  final Profile profile;

  @override
  Widget build(final BuildContext context) {
    return ListTile(
      title: Text(
        profile.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        profile.login,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: profile.role == Role.manager ? const Icon(Icons.security) : null,
      onTap: () => context.pushRoute(
        ProfileEditorRoute(
          uid: profile.uid,
          profile: profile,
        ),
      ),
    );
  }
}
