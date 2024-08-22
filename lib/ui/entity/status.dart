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

