part of 'violations_bloc.dart';

@freezed
sealed class ViolationsState with _$ViolationsState {
  const factory ViolationsState({
    required final int? id,
    required final StatusOf<List<Violation>> violations,
  }) = _ViolationsState;
}
