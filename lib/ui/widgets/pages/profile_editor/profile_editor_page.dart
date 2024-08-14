import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../api/entity/profile/profile.dart';
import '../../../../api/enums/role.dart';
import '../../extensions/mouse_navigator.dart';
import '../../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import 'profile_editor_model.dart';

@RoutePage()
class ProfileEditorPage extends StatelessWidget {
  const ProfileEditorPage({@pathParam this.uid, this.profile, super.key});

  final String? uid;
  final Profile? profile;

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider(
      create: (final context) => ProfileEditor(context, uid: uid, originalProfile: profile),
      child: TaskEditorView(isNew: uid == null),
    );
  }
}

class TaskEditorView extends StatelessWidget {
  const TaskEditorView({
    required this.isNew,
    super.key,
  });

  final bool isNew;

  @override
  Widget build(final BuildContext context) {
    final isLoading = context.select((final ProfileEditor model) => model.isLoading);

    return MouseNavigator(
      child: Scaffold(
        appBar: AppBar(
          title: isNew ? const Text('Yeni çalışan') : null,
          actions: [
            if (!isNew) const _DeleteButton(),
          ],
        ),
        body: isLoading ? const Center(child: CircularProgressIndicator()) : _Body(isNew: isNew),
        bottomNavigationBar: !isLoading ? const _SaveButton() : null,
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.isNew,
  });

  final bool isNew;

  @override
  Widget build(final BuildContext context) {
    return SmoothMouseScroll(
      builder: (final context, final child, final controller, final physics) {
        return SingleChildScrollView(
          controller: controller,
          physics: physics,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _Name(),
                const SizedBox(height: 16),
                const _Login(),
                if (isNew) const _Password(),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    _Role(
                      role: Role.employee,
                      text: 'Normal',
                      icon: Icons.person,
                      isFirst: true,
                    ),
                    _Role(
                      role: Role.manager,
                      text: 'Yönetici',
                      icon: Icons.security,
                      isFirst: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<ProfileEditor>();

    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: kToolbarHeight, height: kToolbarHeight),
      child: IconButton(
        icon: const Icon(Icons.delete),
        tooltip: MaterialLocalizations.of(context).deleteButtonTooltip,
        onPressed: model.delete,
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<ProfileEditor>();

    return TextField(
      decoration: const InputDecoration(
        label: Text('Ad Soyad'),
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
      ),
      controller: model.nameController,
      onChanged: model.onNameChanged,
    );
  }
}

class _Login extends StatelessWidget {
  const _Login();

  @override
  Widget build(final BuildContext context) {
    final model = context.read<ProfileEditor>();

    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text('Kullanıcı adı'),
        prefixIcon: Icon(Icons.lock),
      ),
      controller: model.loginController,
      readOnly: model.exist,
    );
  }
}

class _Password extends StatelessWidget {
  const _Password();

  @override
  Widget build(final BuildContext context) {
    late final ProfileEditor model;
    var isInitialized = false;
    context.select((final ProfileEditor newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.isPasswordVisible;
    });

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: const Text('Şifre'),
          prefixIcon: const Icon(Icons.key),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: IconButton(
              onPressed: model.togglePasswordVisibility,
              icon: Icon(model.isPasswordVisible ? Icons.visibility : Icons.visibility_off),
            ),
          ),
        ),
        controller: model.passwordController,
        obscureText: !model.isPasswordVisible,
      ),
    );
  }
}

class _Role extends StatelessWidget {
  const _Role({
    required this.text,
    required this.role,
    required this.icon,
    final bool? isFirst,
  }) : _borderRadius = isFirst != null
            ? isFirst
                ? _firstBorderRadius
                : _lastBorderRadius
            : BorderRadius.zero;

  static const _firstBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(8),
    bottomLeft: Radius.circular(8),
  );

  static const _lastBorderRadius = BorderRadius.only(
    topRight: Radius.circular(8),
    bottomRight: Radius.circular(8),
  );

  final IconData icon;
  final String text;
  final Role role;
  final BorderRadius _borderRadius;

  @override
  Widget build(final BuildContext context) {
    late final ProfileEditor model;
    var isInitialized = false;
    context.select((final ProfileEditor newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.role;
    });

    return Expanded(
      child: AnimatedCrossFade(
        crossFadeState: model.role == role ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 250),
        firstCurve: Curves.easeIn,
        secondCurve: Curves.easeOut,
        firstChild: _RoleChip(
          isSelected: true,
          onSelected: (final _) => model.role = role,
          borderRadius: _borderRadius,
          icon: icon,
          text: text,
          role: role,
        ),
        secondChild: _RoleChip(
          isSelected: false,
          onSelected: (final _) => model.role = role,
          borderRadius: _borderRadius,
          icon: icon,
          text: text,
          role: role,
        ),
      ),
    );
  }
}

class _RoleChip extends StatelessWidget {
  const _RoleChip({
    required this.isSelected,
    required this.borderRadius,
    required this.icon,
    required this.text,
    required this.role,
    this.onSelected,
  });

  final bool isSelected;
  // ignore: avoid_positional_boolean_parameters
  final Function(bool)? onSelected;
  final BorderRadius borderRadius;
  final IconData icon;
  final String text;
  final Role role;

  @override
  Widget build(final BuildContext context) {
    return ChoiceChip.elevated(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      visualDensity: const VisualDensity(
        horizontal: VisualDensity.maximumDensity,
        vertical: VisualDensity.maximumDensity,
      ),
      showCheckmark: false,
      label: FractionallySizedBox(
        widthFactor: 1,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Theme.of(context).colorScheme.onSecondaryContainer : null,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      selected: isSelected,
      onSelected: onSelected,
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(final BuildContext context) {
    late final ProfileEditor model;
    var isInitialized = false;
    context.select((final ProfileEditor newModel) {
      if (!isInitialized) {
        model = newModel;
        isInitialized = true;
      }
      return model.isUploading;
    });

    return AnimatedCrossFade(
      firstChild: const Padding(
        padding: EdgeInsets.all(8),
        child: LinearProgressIndicator(
          minHeight: 56,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      secondChild: Padding(
        padding: const EdgeInsets.all(8),
        child: FractionallySizedBox(
          widthFactor: 1,
          child: FloatingActionButton.extended(
            icon: const Icon(Icons.save),
            label: const Text('Kaydet'),
            onPressed: model.save,
          ),
        ),
      ),
      crossFadeState: model.isUploading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 500),
    );
  }
}
