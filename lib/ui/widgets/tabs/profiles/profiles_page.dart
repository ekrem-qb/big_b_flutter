import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/enums/role.dart';
import '../../../app_router/app_router.dart';
import '../../error_panel.dart';
import '../../extensions/fade_transition_builder.dart';
import '../../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import '../../list_view_shimmer.dart';
import 'bloc/profiles_bloc.dart';

@RoutePage()
class ProfilesPage extends StatelessWidget {
  const ProfilesPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => ProfilesBloc(),
      child: const ProfilesView(),
    );
  }
}

class ProfilesView extends StatelessWidget {
  const ProfilesView({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Çalışanlar'),
      ),
      body: const _ProfilesList(),
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

class _ProfilesList extends StatelessWidget {
  const _ProfilesList();

  @override
  Widget build(final BuildContext context) {
    late final ProfilesBloc bloc;
    var isInitialized = false;
    context.select((final ProfilesBloc newBloc) {
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
        ProfilesStateLoading() => const ListViewShimmer(),
        ProfilesStateError(
          :final error
        ) =>
          ErrorPanel(
            error: error,
            onRefresh: () => bloc.add(const ProfilesEventLoadRequested()),
          ),
        ProfilesStateData() => const _ProfilesListContent(),
      },
    );
  }
}

class _ProfilesListContent extends StatelessWidget {
  const _ProfilesListContent();

  @override
  Widget build(final BuildContext context) {
    final count = context.select((final ProfilesBloc bloc) {
      return switch (bloc.state) {
        ProfilesStateData(
          :final profiles
        ) =>
          profiles.length,
        _ => 0,
      };
    });

    return count == 0
        ? const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.person,
                  size: 64,
                ),
                Text('Çalışan yok'),
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
    final exists = context.select((final ProfilesBloc bloc) {
      return switch (bloc.state) {
        ProfilesStateData(
          :final profiles,
        ) =>
          profiles.length >= index,
        _ => false,
      };
    });

    return exists
        ? Card(
            child: _ItemContent(index),
          )
        : const SizedBox.shrink();
  }
}

class _ItemContent extends StatelessWidget {
  const _ItemContent(this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    final profile = context.select((final ProfilesBloc bloc) {
      return switch (bloc.state) {
        ProfilesStateData(
          :final profiles,
        ) =>
          profiles.elementAtOrNull(index),
        _ => null,
      };
    });

    return profile != null
        ? ListTile(
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
          )
        : const SizedBox.shrink();
  }
}
