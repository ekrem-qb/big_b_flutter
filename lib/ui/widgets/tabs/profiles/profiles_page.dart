import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../api/enums/role.dart';
import '../../../../constants.dart';
import '../../extensions/smooth_scroll/smooth_scroll_widget.dart';
import 'profiles_model.dart';

class ProfilesPage extends StatelessWidget {
  const ProfilesPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: Profiles.new,
      child: const Scaffold(
        body: _ProfilesList(),
        floatingActionButton: _NewProfileButton(),
      ),
    );
  }
}

class _NewProfileButton extends StatelessWidget {
  const _NewProfileButton();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<Profiles>();

    return FloatingActionButton(
      onPressed: model.newProfile,
      child: const Icon(Icons.add),
    );
  }
}

class _ProfilesList extends StatelessWidget {
  const _ProfilesList();

  @override
  Widget build(final BuildContext context) {
    late final Profiles model;
    var isInitialized = false;
    context.select((final Profiles newModel) {
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
        : const _ProfilesListContent();
  }
}

class _ProfilesListContent extends StatelessWidget {
  const _ProfilesListContent();

  @override
  Widget build(final BuildContext context) {
    late final Profiles model;
    var isInitialized = false;
    context.select((final Profiles newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.profiles.length;
    });

    return model.profiles.isEmpty
        ? const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.sentiment_very_dissatisfied,
                  size: 64,
                ),
                Text('No Profiles'),
              ],
            ),
          )
        : isDesktop
            ? SmoothScroll(
                controller: model.scrollController,
                child: ListView.builder(
                  controller: model.scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: _Item.new,
                  itemCount: model.profiles.length,
                ),
              )
            : ListView.builder(
                controller: model.scrollController,
                itemBuilder: _Item.new,
                itemCount: model.profiles.length,
              );
  }
}

class _Item extends StatelessWidget {
  const _Item(final BuildContext _, this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: _ItemContent(index),
    );
  }
}

class _ItemContent extends StatelessWidget {
  const _ItemContent(this.index);

  final int index;

  @override
  Widget build(final BuildContext context) {
    late final Profiles model;
    var isInitialized = false;
    context.select((final Profiles newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.profiles.elementAtOrNull(index);
    });

    return model.profiles.length >= index
        ? ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            title: Text(
              model.profiles[index].name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              model.profiles[index].login,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: model.profiles[index].role == Role.manager ? const Icon(Icons.security) : null,
            onTap: () => model.open(index),
          )
        : const _DeletedItemContent();
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
    );
  }
}
