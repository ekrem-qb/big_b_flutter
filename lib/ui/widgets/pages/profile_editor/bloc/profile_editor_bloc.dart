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
                  loadingState: originalProfile == null ? const StatusLoading() : const StatusCompleted(),
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
        ProfileEditorEventPasswordVisibilityToggled() => _onPasswordVisibilityToggled(event, emit),
        ProfileEditorEventRoleChanged() => _onRoleChanged(event, emit),
        ProfileEditorEventSaveRequested() => _onSaveRequested(event, emit),
        ProfileEditorEventDeleteRequested() => _onDeleteRequested(event, emit),
      };
    });
    if (state
        case ProfileEditorStateEdit(
          loadingState: StatusLoading(),
        )) {
      add(const ProfileEditorEventLoadRequested());
    }
  }

  Future<void> _onLoadRequested(final ProfileEditorEvent event, final Emitter<ProfileEditorState> emit) async {
    final currentState = state;

    if (currentState is! ProfileEditorStateEdit) return;

    emit(
      currentState.copyWith(
        loadingState: const StatusLoading(),
      ),
    );

    try {
      final profile = await db.from(Profile.tableName).select(Profile.fieldNames).eq($ProfileImplJsonKeys.uid, currentState.uid).single().withConverter(Profile.fromJson);
      emit(
        currentState.copyWith(
          loadingState: const StatusCompleted(),
          name: profile.name,
          login: profile.login,
          role: profile.role,
        ),
      );
    } catch (e) {
      emit(
        currentState.copyWith(
          loadingState: StatusError(e.toString()),
        ),
      );
    }
  }

  Future<void> _onNameChanged(final ProfileEditorEventNameChanged event, final Emitter<ProfileEditorState> emit) async {
    final currentState = state;

    switch (currentState) {
      case ProfileEditorStateEdit():
        emit(
          currentState.copyWith(
            name: event.value,
            nameError: null,
          ),
        );
      case ProfileEditorStateCreate():
        emit(
          currentState.copyWith(
            name: event.value,
            login: removeDiacritics(event.value).toSnakeCase(),
            nameError: null,
          ),
        );
      default:
        return;
    }
  }

  Future<void> _onLoginChanged(final ProfileEditorEventLoginChanged event, final Emitter<ProfileEditorState> emit) async {
    final currentState = state;

    if (currentState is! ProfileEditorStateCreate) return;

    emit(
      currentState.copyWith(
        login: event.value,
        loginError: null,
      ),
    );
  }

  Future<void> _onPasswordChanged(final ProfileEditorEventPasswordChanged event, final Emitter<ProfileEditorState> emit) async {
    final currentState = state;

    if (currentState is! ProfileEditorStateCreate) return;

    emit(
      currentState.copyWith(
        password: event.value,
        passwordError: null,
      ),
    );
  }

  Future<void> _onPasswordVisibilityToggled(final ProfileEditorEventPasswordVisibilityToggled event, final Emitter<ProfileEditorState> emit) async {
    final currentState = state;

    if (currentState is! ProfileEditorStateCreate) return;

    emit(
      currentState.copyWith(
        isPasswordVisible: !currentState.isPasswordVisible,
      ),
    );
  }

  Future<void> _onRoleChanged(final ProfileEditorEventRoleChanged event, final Emitter<ProfileEditorState> emit) async {
    final currentState = state;

    switch (currentState) {
      case ProfileEditorStateCreate():
        emit(
          currentState.copyWith(
            role: event.value,
          ),
        );
      case ProfileEditorStateEdit():
        emit(
          currentState.copyWith(
            role: event.value,
          ),
        );
      default:
    }
  }

  Future<void> _onSaveRequested(final ProfileEditorEventSaveRequested event, final Emitter<ProfileEditorState> emit) async {
    final currentState = state;

    switch (currentState) {
      case ProfileEditorStateCreate():
        emit(
          currentState.copyWith(
            name: currentState.name.trim(),
          ),
        );

        if (currentState.name.isEmpty) {
          emit(
            currentState.copyWith(
              nameError: 'Ad Soyad giriniz',
            ),
          );
          return;
        }

        emit(
          currentState.copyWith(
            login: currentState.login.trim(),
          ),
        );

        if (currentState.login.isEmpty) {
          emit(
            currentState.copyWith(
              loginError: 'Kullanıcı adını giriniz',
            ),
          );
          return;
        }

        emit(
          currentState.copyWith(
            password: currentState.password.trim(),
          ),
        );

        if (currentState.password.isEmpty) {
          emit(
            currentState.copyWith(
              passwordError: 'Şifre giriniz',
            ),
          );
          return;
        }

        emit(
          currentState.copyWith(
            uploadState: const OperationStatusInProgress(),
          ),
        );

        if (await _upload(emit: emit)) {
          emit(
            currentState.copyWith(
              uploadState: const OperationStatusCompleted(),
            ),
          );
        } else {
          emit(
            currentState.copyWith(
              uploadState: const OperationStatusInitial(),
            ),
          );
        }
      case ProfileEditorStateEdit():
        emit(
          currentState.copyWith(
            name: currentState.name.trim(),
          ),
        );

        if (currentState.name.isEmpty) {
          emit(
            currentState.copyWith(
              nameError: 'Ad Soyad giriniz',
            ),
          );
        }

        emit(
          currentState.copyWith(
            uploadState: const OperationStatusInProgress(),
          ),
        );

        if (await _upload(emit: emit)) {
          emit(
            currentState.copyWith(
              uploadState: const OperationStatusCompleted(),
            ),
          );
          return;
        } else {
          emit(
            currentState.copyWith(
              uploadState: const OperationStatusInitial(),
            ),
          );
        }
      default:
    }
  }

  Future<bool> _upload({required final Emitter<ProfileEditorState> emit}) async {
    final currentState = state;
    try {
      switch (currentState) {
        case ProfileEditorStateCreate(
                :final name,
                :final login,
                :final role,
              ) ||
              ProfileEditorStateEdit(
                :final name,
                :final login,
                :final role,
              ):
          final profile = Profile(
            uid: '',
            name: name,
            createdAt: DateTime.now(),
            login: login,
            role: role,
          );

          switch (currentState) {
            case ProfileEditorStateCreate(
                :final login,
                :final password,
              ):
              final json = profile.toJson();
              await db.auth.signUp(
                email: _addMail(login),
                password: password,
                data: json,
              );
            case ProfileEditorStateEdit(
                :final uid,
              ):
              await db.from(Profile.tableName).update(profile.toJson()).eq($ProfileImplJsonKeys.uid, uid);
            default:
          }

          return true;
        default:
          return false;
      }
    } catch (e) {
      switch (currentState) {
        case ProfileEditorStateCreate():
          emit(currentState.copyWith(uploadState: OperationStatusError(e.toString())));
        case ProfileEditorStateEdit():
          emit(currentState.copyWith(uploadState: OperationStatusError(e.toString())));
        default:
      }
      return false;
    }
  }

  String _addMail(final String login) {
    if (login.contains('@')) return login;

    return '$login@${(db.auth.currentUser?.email ?? 'mail.com').split('@')[1]}';
  }

  Future<void> _onDeleteRequested(final ProfileEditorEventDeleteRequested event, final Emitter<ProfileEditorState> emit) async {
    final currentState = state;

    if (currentState is! ProfileEditorStateEdit) return;

    emit(
      currentState.copyWith(
        deleteState: const OperationStatusInProgress(),
      ),
    );

    try {
      await db.from(Profile.tableName).update({
        $ProfileImplJsonKeys.isDeleted: true,
      }).eq($ProfileImplJsonKeys.uid, currentState.uid);

      emit(
        currentState.copyWith(
          deleteState: const OperationStatusCompleted(),
        ),
      );
    } catch (e) {
      emit(
        currentState.copyWith(
          deleteState: OperationStatusError(e.toString()),
        ),
      );
    }
  }
}
