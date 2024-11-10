import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../api/database.dart';
import '../../../../../api/entity/profile/profile.dart';
import '../../../../entity/status.dart';

part 'profile_picker_bloc.freezed.dart';
part 'profile_picker_event.dart';
part 'profile_picker_state.dart';

class ProfilePickerBloc extends Bloc<ProfilePickerEvent, ProfilePickerState> {
  ProfilePickerBloc({required final List<Profile> excluded}) : super(ProfilePickerState(excluded: excluded)) {
    on<ProfilePickerEvent>((final event, final emit) async {
      return switch (event) {
        ProfilePickerEventLoadRequested() => onLoadRequested(event, emit),
        ProfilePickerEventSelected() => onSelected(event, emit),
        ProfilePickerEventDeselected() => onDeselected(event, emit),
      };
    });

    if (state.all is StatusOfLoading) {
      add(const ProfilePickerEventLoadRequested());
    }
  }

  Future<void> onLoadRequested(final ProfilePickerEventLoadRequested event, final Emitter<ProfilePickerState> emit) async {
    try {
      final List<Profile> all;

      if (state.excluded.isEmpty) {
        all = await db.from(Profile.tableName).select(Profile.fieldNames).withConverter(Profile.converter) ?? List.empty();
      } else {
        all = await db
                .from(Profile.tableName)
                .select(Profile.fieldNames)
                .not(
                  $ProfileImplJsonKeys.uid,
                  'in',
                  '(${state.excluded.map((final profile) => profile.uid).join(',')})',
                )
                .withConverter(Profile.converter) ??
            List.empty();
      }

      emit(state.copyWith(all: StatusOfData(all)));
    } catch (e) {
      emit(state.copyWith(all: StatusOfError(e.toString())));
    }
  }

  Future<void> onSelected(final ProfilePickerEventSelected event, final Emitter<ProfilePickerState> emit) async {
    if (state.all case final StatusOfData<List<Profile>> all) {
      emit(
        state.copyWith(
          selected: [
            ...state.selected,
            all.data[event.index],
          ],
        ),
      );
    }
  }

  Future<void> onDeselected(final ProfilePickerEventDeselected event, final Emitter<ProfilePickerState> emit) async {
    if (state.all case final StatusOfData<List<Profile>> all) {
      emit(
        state.copyWith(
          selected: [
            ...state.selected.where((final profile) => profile.uid != all.data[event.index].uid),
          ],
        ),
      );
    }
  }
}
