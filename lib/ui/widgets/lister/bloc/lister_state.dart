part of 'lister_bloc.dart';

@freezed
sealed class ListerState<T> with _$ListerState {
  const factory ListerState.data({
    required final List<T> items,
  }) = ListerStateData;

  const factory ListerState.loading() = ListerStateLoading;

  const factory ListerState.error({
    required final String error,
  }) = ListerStateError;
}
