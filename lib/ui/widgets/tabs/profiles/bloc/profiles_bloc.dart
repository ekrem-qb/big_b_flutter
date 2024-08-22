import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/profile/profile.dart';

part 'profiles_bloc.freezed.dart';
part 'profiles_event.dart';
part 'profiles_state.dart';

class ProfilesBloc extends Bloc<ProfilesEvent, ProfilesState> {
  ProfilesBloc() : super(const ProfilesStateLoading()) {
    on<ProfilesEvent>((final event, final emit) {
      return switch (event) {
        ProfilesEventLoadRequested() => _onLoadRequested(emit, event),
        _ProfilesEventDataUpdated() => _onDataUpdated(emit, event),
      };
    });

    _profilesSubscriptions = [
      db
          .channel(Profile.tableName)
          .onPostgresChanges(
            table: Profile.tableName,
            event: PostgresChangeEvent.all,
            callback: (final payload) => add(_ProfilesEventDataUpdated(payload: payload)),
          )
          .subscribe(),
    ];

    add(const ProfilesEventLoadRequested());
  }

  late final List<RealtimeChannel> _profilesSubscriptions;

  Future<void> _onLoadRequested(final Emitter<ProfilesState> emit, final ProfilesEventLoadRequested event) async {
    try {
      if (state is ProfilesStateError) {
        emit(const ProfilesStateLoading());
      }

      final profiles = await db.from(Profile.tableName).select(Profile.fieldNames).order($ProfileImplJsonKeys.createdAt).withConverter(Profile.converter) ?? List.empty();
      emit(ProfilesStateData(profiles: profiles));
    } on Exception catch (e) {
      emit(ProfilesStateError(error: e.toString()));
    }
  }

  Future<void> _onDataUpdated(final Emitter<ProfilesState> emit, final _ProfilesEventDataUpdated event) async {
    final currentState = state;
    if (currentState is! ProfilesStateData) return;

    final newProfiles = switch (event.payload.eventType) {
      PostgresChangeEvent.insert => _insert(Profile.fromJson(event.payload.newRecord), currentState.profiles),
      PostgresChangeEvent.update => _insert(Profile.fromJson(event.payload.newRecord), _delete(event.payload.oldRecord[$ProfileImplJsonKeys.uid], currentState.profiles) ?? currentState.profiles),
      PostgresChangeEvent.delete => _delete(event.payload.oldRecord[$ProfileImplJsonKeys.uid], currentState.profiles),
      _ => null,
    };

    if (newProfiles != null) {
      emit(currentState.copyWith(profiles: newProfiles));
    }
  }

  List<Profile> _insert(final Profile newProfile, final List<Profile> profiles) {
    for (var i = 0; i < profiles.length; i++) {
      if (newProfile.createdAt.isAfter(profiles[i].createdAt)) {
        return [
          ...profiles.sublist(0, i),
          newProfile,
          ...profiles.sublist(i),
        ];
      }
    }

    return [
      ...profiles,
      newProfile,
    ];
  }

  List<Profile>? _delete(final String uid, final List<Profile> profiles) {
    for (var i = 0; i < profiles.length; i++) {
      if (uid == profiles[i].uid) {
        return [
          ...profiles.sublist(0, i),
          ...profiles.sublist(i + 1),
        ];
      }
    }

    return null;
  }

  @override
  Future<void> close() {
    for (var i = 0; i < _profilesSubscriptions.length; i++) {
      _profilesSubscriptions[i].unsubscribe();
    }
    return super.close();
  }
}
