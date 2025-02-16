import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remove_diacritic/remove_diacritic.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/profile/profile.dart';
import '../../../../../api/enums/role.dart';
import '../../../../../extensions/case_helpers.dart';
import '../../../../entity/status.dart';

part 'profile_editor_bloc.freezed.dart';
part 'profile_editor_event.dart';
part 'profile_editor_state.dart';

class ProfileEditorBloc extends Bloc<ProfileEditorEvent, ProfileEditorState> {
  ProfileEditorBloc({final String? uid, final Profile? originalProfile})
    : super(
        uid == null
            ? const ProfileEditorStateCreate()
            : ProfileEditorStateEdit(
              uid: uid,
              loadingState:
                  originalProfile == null
                      ? const StatusLoading()
                      : const StatusCompleted(),
              name: originalProfile?.name ?? '',
              login: originalProfile?.login ?? '',
              role: originalProfile?.role ?? Role.employee,
            ),
      ) {
    on<ProfileEditorEvent>((final event, final emit) {
      return switch (event) {
        ProfileEditorEventLoadRequested() => _onLoadRequested(event, emit),
        ProfileEditorEventNameChanged() => _onNameChanged(event, emit),
        ProfileEditorEventLoginChanged() => _onLoginChanged(event, emit),
        ProfileEditorEventPasswordChanged() => _onPasswordChanged(event, emit),
        ProfileEditorEventPasswordVisibilityToggled() =>
          _onPasswordVisibilityToggled(event, emit),
        ProfileEditorEventRoleChanged() => _onRoleChanged(event, emit),
        ProfileEditorEventSaveRequested() => _onSaveRequested(event, emit),
        ProfileEditorEventDeleteRequested() => _onDeleteRequested(event, emit),
      };
    });
    if (state case ProfileEditorStateEdit(loadingState: StatusLoading())) {
      add(const ProfileEditorEventLoadRequested());
    }
  }

  Future<void> _onLoadRequested(
    final ProfileEditorEvent event,
    final Emitter<ProfileEditorState> emit,
  ) async {
    final currentState = state;

    if (currentState is! ProfileEditorStateEdit) return;

    emit(currentState.copyWith(loadingState: const StatusLoading()));

    try {
      final profile = await db
          .from(Profile.tableName)
          .select(Profile.fieldNames)
          .eq($ProfileImplJsonKeys.uid, currentState.uid)
          .single()
          .withConverter(Profile.fromJson);
      emit(
        currentState.copyWith(
          loadingState: const StatusCompleted(),
          name: profile.name,
          login: profile.login,
          role: profile.role,
        ),
      );
    } catch (e) {
      emit(currentState.copyWith(loadingState: StatusError(e.toString())));
    }
  }

  Future<void> _onNameChanged(
    final ProfileEditorEventNameChanged event,
    final Emitter<ProfileEditorState> emit,
  ) async {
    switch (state) {
      case ProfileEditorStateEdit():
        emit(state.copyWith(name: event.value, nameError: null));
      case ProfileEditorStateCreate():
        emit(
          state.copyWith(
            name: event.value,
            login: removeDiacritics(event.value).toSnakeCase(),
            nameError: null,
          ),
        );
    }
  }

  Future<void> _onLoginChanged(
    final ProfileEditorEventLoginChanged event,
    final Emitter<ProfileEditorState> emit,
  ) async {
    final currentState = state;

    if (currentState is! ProfileEditorStateCreate) return;

    emit(currentState.copyWith(login: event.value, loginError: null));
  }

  Future<void> _onPasswordChanged(
    final ProfileEditorEventPasswordChanged event,
    final Emitter<ProfileEditorState> emit,
  ) async {
    final currentState = state;

    if (currentState is! ProfileEditorStateCreate) return;

    emit(currentState.copyWith(password: event.value, passwordError: null));
  }

  Future<void> _onPasswordVisibilityToggled(
    final ProfileEditorEventPasswordVisibilityToggled event,
    final Emitter<ProfileEditorState> emit,
  ) async {
    final currentState = state;

    if (currentState is! ProfileEditorStateCreate) return;

    emit(
      currentState.copyWith(isPasswordVisible: !currentState.isPasswordVisible),
    );
  }

  Future<void> _onRoleChanged(
    final ProfileEditorEventRoleChanged event,
    final Emitter<ProfileEditorState> emit,
  ) async {
    emit(state.copyWith(role: event.value));
  }

  Future<void> _onSaveRequested(
    final ProfileEditorEventSaveRequested event,
    final Emitter<ProfileEditorState> emit,
  ) async {
    emit(state.copyWith(name: state.name.trim()));

    if (state.name.isEmpty) {
      emit(state.copyWith(nameError: 'Ad Soyad giriniz'));
      return;
    }

    switch (state) {
      case ProfileEditorStateCreate(:final password, :final copyWith):
        emit(copyWith(login: state.login.trim()));

        if (state.login.isEmpty) {
          emit(copyWith(loginError: 'Kullanıcı adını giriniz'));
          return;
        }

        emit(copyWith(password: password.trim()));

        if (password.isEmpty) {
          emit(copyWith(passwordError: 'Şifre giriniz'));
          return;
        }
      case ProfileEditorStateEdit():
    }

    emit(state.copyWith(uploadState: const OperationStatusInProgress()));

    if (await _upload(emit: emit)) {
      emit(state.copyWith(uploadState: const OperationStatusCompleted()));
    } else {
      emit(state.copyWith(uploadState: const OperationStatusInitial()));
    }
  }

  Future<bool> _upload({
    required final Emitter<ProfileEditorState> emit,
  }) async {
    try {
      final profile = Profile(
        uid: '',
        name: state.name,
        createdAt: DateTime.now(),
        login: state.login,
        role: state.role,
      );

      switch (state) {
        case ProfileEditorStateCreate(:final login, :final password):
          final json = profile.toJson();
          await db.auth.signUp(
            email: _addMail(login),
            password: password,
            data: json,
          );
        case ProfileEditorStateEdit(:final uid):
          await db
              .from(Profile.tableName)
              .update(profile.toJson())
              .eq($ProfileImplJsonKeys.uid, uid);
      }

      return true;
    } catch (e) {
      emit(state.copyWith(uploadState: OperationStatusError(e.toString())));
      return false;
    }
  }

  String _addMail(final String login) {
    if (login.contains('@')) return login;

    return '$login@${(db.auth.currentUser?.email ?? 'mail.com').split('@')[1]}';
  }

  Future<void> _onDeleteRequested(
    final ProfileEditorEventDeleteRequested event,
    final Emitter<ProfileEditorState> emit,
  ) async {
    final currentState = state;

    if (currentState is! ProfileEditorStateEdit) return;

    emit(currentState.copyWith(deleteState: const OperationStatusInProgress()));

    try {
      await db
          .from(Profile.tableName)
          .update({$ProfileImplJsonKeys.isDeleted: true})
          .eq($ProfileImplJsonKeys.uid, currentState.uid);

      emit(
        currentState.copyWith(deleteState: const OperationStatusCompleted()),
      );
    } catch (e) {
      emit(
        currentState.copyWith(deleteState: OperationStatusError(e.toString())),
      );
    }
  }
}
