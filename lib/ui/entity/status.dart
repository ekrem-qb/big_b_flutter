import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
sealed class OperationStatus with _$OperationStatus {
  const factory OperationStatus.initial() = OperationStatusInitial;
  const factory OperationStatus.inProgress() = OperationStatusInProgress;
  const factory OperationStatus.error(final Object error) =
      OperationStatusError;
  const factory OperationStatus.completed() = OperationStatusCompleted;
}

@freezed
sealed class Status with _$Status {
  const factory Status.loading() = StatusLoading;
  const factory Status.error(final Object error) = StatusError;
  const factory Status.completed() = StatusCompleted;
}

@freezed
sealed class StatusOf<D> with _$StatusOf<D> {
  const factory StatusOf.data(final D data) = StatusOfData;
  const factory StatusOf.loading() = StatusOfLoading;
  const factory StatusOf.error(final Object error) = StatusOfError;
}
