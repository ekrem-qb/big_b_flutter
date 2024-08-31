import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
sealed class OperationStatus with _$OperationStatus {
  const factory OperationStatus.initial() = OperationStatusInitial;
  const factory OperationStatus.inProgress() = OperationStatusInProgress;
  const factory OperationStatus.error(final String error) = OperationStatusError;
  const factory OperationStatus.completed() = OperationStatusCompleted;
}

@freezed
sealed class Status with _$Status {
  const factory Status.loading() = StatusLoading;
  const factory Status.error(final String error) = StatusError;
  const factory Status.completed() = StatusCompleted;
}

@freezed
sealed class StatusOf<T> with _$StatusOf<T> {
  const factory StatusOf.data(final T data) = StatusOfData;
  const factory StatusOf.loading() = StatusOfLoading;
  const factory StatusOf.error(final String error) = StatusOfError;
}
