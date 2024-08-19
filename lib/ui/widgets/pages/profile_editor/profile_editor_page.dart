import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/entity/profile/profile.dart';
import '../../../../api/enums/role.dart';
import '../../dialogs/delete_dialog.dart';
import '../../extensions/mouse_navigator.dart';
import '../../extensions/smooth_mouse_scroll/smooth_mouse_scroll.dart';
import '../../extensions/snackbar.dart';
import 'bloc/profile_editor_bloc.dart';

@RoutePage()
class NewProfileEditorPage extends StatelessWidget {
  const NewProfileEditorPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => ProfileEditorBloc(),
      child: const TaskEditorView(isNew: true),
    );
  }
}

@RoutePage()
class ProfileEditorPage extends StatelessWidget {
  const ProfileEditorPage({@pathParam required this.uid, this.profile, super.key});

  final String uid;
  final Profile? profile;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => ProfileEditorBloc(uid: uid, originalProfile: profile),
      child: const TaskEditorView(isNew: false),
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
    late final ProfileEditorBloc bloc;
    var isInitialized = false;
    context.select((final ProfileEditorBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return bloc.state.runtimeType;
    });

    return MouseNavigator(
      child: BlocListener<ProfileEditorBloc, ProfileEditorState>(
        listener: (final context, final state) async {
          switch (state) {
            case ProfileEditorStateCreate(
                    :final uploadState,
                  ) ||
                  ProfileEditorStateEdit(
                    :final uploadState,
                  ):
              switch (uploadState) {
                case StatusCompleted():
                  Navigator.pop(context);
                case StatusError(
                    :final error
                  ):
                  showSnackbar(text: error, context: context);
                default:
              }
              switch (state) {
                case ProfileEditorStateEdit(
                    :final deleteState
                  ):
                  switch (deleteState) {
                    case StatusInProgress():
                      final isDeleted = await showDeleteDialog(itemName: 'çalışanı', context: context);
                      bloc.add(ProfileEditorEventDeleteDialogClosed(isDeleted: isDeleted));
                    case StatusCompleted():
                      Navigator.pop(context);
                    case StatusError(
                        :final error
                      ):
                      showSnackbar(text: error, context: context);
                    default:
                  }
                default:
              }
            case ProfileEditorStateError(
                :final error
              ):
              showSnackbar(text: error, context: context);
              Navigator.pop(context);
            default:
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: isNew ? const Text('Yeni çalışan') : null,
            actions: [
              if (!isNew) const _DeleteButton(),
            ],
          ),
          body: bloc.state is ProfileEditorStateLoading ? const Center(child: CircularProgressIndicator()) : _Body(isNew: isNew),
          bottomNavigationBar: bloc.state is! ProfileEditorStateLoading ? const _SaveButton() : null,
        ),
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
    final bloc = context.read<ProfileEditorBloc>();

    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: kToolbarHeight, height: kToolbarHeight),
      child: IconButton(
        icon: const Icon(Icons.delete),
        tooltip: MaterialLocalizations.of(context).deleteButtonTooltip,
        onPressed: () => bloc.add(const ProfileEditorEventDeleteDialogOpened()),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name();

  @override
  Widget build(final BuildContext context) {
    late final ProfileEditorBloc bloc;
    var isInitialized = false;
    final error = context.select((final ProfileEditorBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (newBloc.state) {
        ProfileEditorStateCreate(
          :final nameError
        ) ||
        ProfileEditorStateEdit(
          :final nameError
        ) =>
          nameError,
        _ => '',
      };
    });
    final name = switch (bloc.state) {
      ProfileEditorStateCreate(
        :final name
      ) ||
      ProfileEditorStateEdit(
        :final name
      ) =>
        name,
      _ => '',
    };

    return TextFormField(
      decoration: InputDecoration(
        label: const Text('Ad Soyad'),
        prefixIcon: const Icon(Icons.person),
        errorText: error,
      ),
      initialValue: name,
      onChanged: (final value) => bloc.add(ProfileEditorEventNameChanged(value)),
    );
  }
}

class _Login extends StatefulWidget {
  const _Login();

  @override
  State<_Login> createState() => _LoginState();
}

class _LoginState extends State<_Login> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    final state = context.read<ProfileEditorBloc>().state;
    _controller.text = switch (state) {
      ProfileEditorStateCreate(
        :final login
      ) ||
      ProfileEditorStateEdit(
        :final login
      ) =>
        login,
      _ => '',
    };
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    late final ProfileEditorBloc bloc;
    var isInitialized = false;
    final error = context.select((final ProfileEditorBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (newBloc.state) {
        ProfileEditorStateCreate(
          :final loginError
        ) =>
          loginError,
        _ => null,
      };
    });

    return BlocListener<ProfileEditorBloc, ProfileEditorState>(
      listenWhen: (final previous, final current) => switch (previous) {
        ProfileEditorStateCreate(
          :final login
        ) =>
          login !=
              switch (current) {
                ProfileEditorStateCreate(
                  :final login
                ) =>
                  login,
                _ => '',
              },
        _ => false,
      },
      listener: (final context, final state) {
        _controller.text = switch (state) {
          ProfileEditorStateCreate(
            :final login
          ) =>
            login,
          _ => '',
        };
      },
      child: TextFormField(
        decoration: InputDecoration(
          label: const Text('Kullanıcı adı'),
          prefixIcon: const Icon(Icons.lock),
          errorText: error,
        ),
        controller: _controller,
        readOnly: bloc.state is! ProfileEditorStateCreate,
        onChanged: (final value) => bloc.add(ProfileEditorEventLoginChanged(value)),
      ),
    );
  }
}

class _Password extends StatelessWidget {
  const _Password();

  @override
  Widget build(final BuildContext context) {
    late final ProfileEditorBloc bloc;
    var isInitialized = false;
    final isPasswordVisible = context.select((final ProfileEditorBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state) {
        ProfileEditorStateCreate(
          :final isPasswordVisible
        ) =>
          isPasswordVisible,
        _ => false,
      };
    });
    final error = context.select((final ProfileEditorBloc newBloc) {
      return switch (newBloc.state) {
        ProfileEditorStateCreate(
          :final passwordError
        ) =>
          passwordError,
        _ => '',
      };
    });
    final password = switch (bloc.state) {
      ProfileEditorStateCreate(
        :final password
      ) =>
        password,
      _ => '',
    };

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        decoration: InputDecoration(
          label: const Text('Şifre'),
          prefixIcon: const Icon(Icons.key),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: IconButton(
              onPressed: () => bloc.add(const ProfileEditorEventPasswordVisibilityToggled()),
              icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          errorText: error,
        ),
        initialValue: password,
        obscureText: !isPasswordVisible,
        onChanged: (final value) => bloc.add(ProfileEditorEventPasswordChanged(value)),
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
    late final ProfileEditorBloc bloc;
    var isInitialized = false;
    final currentRole = context.select((final ProfileEditorBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state) {
        ProfileEditorStateCreate(
          :final role
        ) ||
        ProfileEditorStateEdit(
          :final role
        ) =>
          role,
        _ => Role.employee,
      };
    });

    return Expanded(
      child: AnimatedCrossFade(
        crossFadeState: currentRole == role ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 250),
        firstCurve: Curves.easeIn,
        secondCurve: Curves.easeOut,
        firstChild: _RoleChip(
          isSelected: true,
          onSelected: (final _) {},
          borderRadius: _borderRadius,
          icon: icon,
          text: text,
          role: role,
        ),
        secondChild: _RoleChip(
          isSelected: false,
          onSelected: (final _) => bloc.add(ProfileEditorEventRoleChanged(role)),
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
    late final ProfileEditorBloc bloc;
    var isInitialized = false;
    final uploadState = context.select((final ProfileEditorBloc newBloc) {
      if (!isInitialized) {
        bloc = newBloc;
        isInitialized = true;
      }
      return switch (bloc.state) {
        ProfileEditorStateCreate(
          :final uploadState
        ) ||
        ProfileEditorStateEdit(
          :final uploadState
        ) =>
          uploadState,
        _ => const StatusInitial(),
      };
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
            onPressed: () => bloc.add(const ProfileEditorEventSaveRequested()),
          ),
        ),
      ),
      crossFadeState: uploadState is StatusInProgress ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 500),
    );
  }
}
