part of 'lister_bloc.dart';

@freezed
sealed class ListerState<T> with _$ListerState<T> {
  const factory ListerState({
    required final int totalCount,
    required final List<T> items,
  }) = _ListerState;
}
