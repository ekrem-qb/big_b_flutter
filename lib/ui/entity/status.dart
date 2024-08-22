import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
sealed class Status with _$Status {
  const factory Status.initial() = StatusInitial;
  const factory Status.inProgress() = StatusInProgress;
  const factory Status.error({
    required final String error,
  }) = StatusError;
  const factory Status.completed() = StatusCompleted;
}

@freezed
sealed class StatusOf<T> with _$StatusOf<T> {
  const factory StatusOf.data({
    required final T data,
  }) = StatusOfData;
  const factory StatusOf.loading() = StatusOfLoading;
  const factory StatusOf.error({
    required final String error,
  }) = StatusOfError;
}
