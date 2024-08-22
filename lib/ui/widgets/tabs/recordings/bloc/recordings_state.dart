part of 'recordings_bloc.dart';

@freezed
sealed class RecordingsState with _$RecordingsState {
  const factory RecordingsState.data({
    required final List<Recording> recordings,
  }) = RecordingsStateData;

  const factory RecordingsState.loading() = RecordingsStateLoading;

  const factory RecordingsState.error({
    required final String error,
  }) = RecordingsStateError;
}
