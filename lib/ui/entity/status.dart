import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';

@freezed
sealed class OperationStatus<E> with _$OperationStatus<E> {
  const factory OperationStatus.initial() = OperationStatusInitial;
  const factory OperationStatus.inProgress() = OperationStatusInProgress;
  const factory OperationStatus.error(final E error) = OperationStatusError;
  const factory OperationStatus.completed() = OperationStatusCompleted;
}

@freezed
sealed class Status<E> with _$Status<E> {
  const factory Status.loading() = StatusLoading;
  const factory Status.error(final E error) = StatusError;
  const factory Status.completed() = StatusCompleted;
}

@freezed
sealed class StatusOf<D, E> with _$StatusOf<D, E> {
  const factory StatusOf.data(final D data) = StatusOfData;
  const factory StatusOf.loading() = StatusOfLoading;
  const factory StatusOf.error(final E error) = StatusOfError;
}
