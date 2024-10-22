part of 'violations_bloc.dart';

@freezed
sealed class ViolationsEvent with _$ViolationsEvent {
  const factory ViolationsEvent.loadRequested() = ViolationsEventLoadRequested;
}
