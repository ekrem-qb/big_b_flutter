// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_viewer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskViewerEvent {}

/// @nodoc
abstract class $TaskViewerEventCopyWith<$Res> {
  factory $TaskViewerEventCopyWith(
          TaskViewerEvent value, $Res Function(TaskViewerEvent) then) =
      _$TaskViewerEventCopyWithImpl<$Res, TaskViewerEvent>;
}

/// @nodoc
class _$TaskViewerEventCopyWithImpl<$Res, $Val extends TaskViewerEvent>
    implements $TaskViewerEventCopyWith<$Res> {
  _$TaskViewerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskViewerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TaskViewerEventLoadRequestedImplCopyWith<$Res> {
  factory _$$TaskViewerEventLoadRequestedImplCopyWith(
          _$TaskViewerEventLoadRequestedImpl value,
          $Res Function(_$TaskViewerEventLoadRequestedImpl) then) =
      __$$TaskViewerEventLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskViewerEventLoadRequestedImplCopyWithImpl<$Res>
    extends _$TaskViewerEventCopyWithImpl<$Res,
        _$TaskViewerEventLoadRequestedImpl>
    implements _$$TaskViewerEventLoadRequestedImplCopyWith<$Res> {
  __$$TaskViewerEventLoadRequestedImplCopyWithImpl(
      _$TaskViewerEventLoadRequestedImpl _value,
      $Res Function(_$TaskViewerEventLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskViewerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskViewerEventLoadRequestedImpl
    implements TaskViewerEventLoadRequested {
  const _$TaskViewerEventLoadRequestedImpl();

  @override
  String toString() {
    return 'TaskViewerEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskViewerEventLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class TaskViewerEventLoadRequested implements TaskViewerEvent {
  const factory TaskViewerEventLoadRequested() =
      _$TaskViewerEventLoadRequestedImpl;
}

/// @nodoc
abstract class _$$TaskViewerEventDeleteRequestedImplCopyWith<$Res> {
  factory _$$TaskViewerEventDeleteRequestedImplCopyWith(
          _$TaskViewerEventDeleteRequestedImpl value,
          $Res Function(_$TaskViewerEventDeleteRequestedImpl) then) =
      __$$TaskViewerEventDeleteRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskViewerEventDeleteRequestedImplCopyWithImpl<$Res>
    extends _$TaskViewerEventCopyWithImpl<$Res,
        _$TaskViewerEventDeleteRequestedImpl>
    implements _$$TaskViewerEventDeleteRequestedImplCopyWith<$Res> {
  __$$TaskViewerEventDeleteRequestedImplCopyWithImpl(
      _$TaskViewerEventDeleteRequestedImpl _value,
      $Res Function(_$TaskViewerEventDeleteRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskViewerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskViewerEventDeleteRequestedImpl
    implements TaskViewerEventDeleteRequested {
  const _$TaskViewerEventDeleteRequestedImpl();

  @override
  String toString() {
    return 'TaskViewerEvent.deleteRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskViewerEventDeleteRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class TaskViewerEventDeleteRequested implements TaskViewerEvent {
  const factory TaskViewerEventDeleteRequested() =
      _$TaskViewerEventDeleteRequestedImpl;
}

/// @nodoc
mixin _$TaskViewerState {
  int get id => throw _privateConstructorUsedError;
  StatusOf<Task> get task => throw _privateConstructorUsedError;
  OperationStatus get deleteState => throw _privateConstructorUsedError;

  /// Create a copy of TaskViewerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskViewerStateCopyWith<TaskViewerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskViewerStateCopyWith<$Res> {
  factory $TaskViewerStateCopyWith(
          TaskViewerState value, $Res Function(TaskViewerState) then) =
      _$TaskViewerStateCopyWithImpl<$Res, TaskViewerState>;
  @useResult
  $Res call({int id, StatusOf<Task> task, OperationStatus deleteState});

  $StatusOfCopyWith<Task, $Res> get task;
  $OperationStatusCopyWith<$Res> get deleteState;
}

/// @nodoc
class _$TaskViewerStateCopyWithImpl<$Res, $Val extends TaskViewerState>
    implements $TaskViewerStateCopyWith<$Res> {
  _$TaskViewerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskViewerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? task = null,
    Object? deleteState = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as StatusOf<Task>,
      deleteState: null == deleteState
          ? _value.deleteState
          : deleteState // ignore: cast_nullable_to_non_nullable
              as OperationStatus,
    ) as $Val);
  }

  /// Create a copy of TaskViewerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusOfCopyWith<Task, $Res> get task {
    return $StatusOfCopyWith<Task, $Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value) as $Val);
    });
  }

  /// Create a copy of TaskViewerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperationStatusCopyWith<$Res> get deleteState {
    return $OperationStatusCopyWith<$Res>(_value.deleteState, (value) {
      return _then(_value.copyWith(deleteState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskViewerStateImplCopyWith<$Res>
    implements $TaskViewerStateCopyWith<$Res> {
  factory _$$TaskViewerStateImplCopyWith(_$TaskViewerStateImpl value,
          $Res Function(_$TaskViewerStateImpl) then) =
      __$$TaskViewerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, StatusOf<Task> task, OperationStatus deleteState});

  @override
  $StatusOfCopyWith<Task, $Res> get task;
  @override
  $OperationStatusCopyWith<$Res> get deleteState;
}

/// @nodoc
class __$$TaskViewerStateImplCopyWithImpl<$Res>
    extends _$TaskViewerStateCopyWithImpl<$Res, _$TaskViewerStateImpl>
    implements _$$TaskViewerStateImplCopyWith<$Res> {
  __$$TaskViewerStateImplCopyWithImpl(
      _$TaskViewerStateImpl _value, $Res Function(_$TaskViewerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskViewerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? task = null,
    Object? deleteState = null,
  }) {
    return _then(_$TaskViewerStateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as StatusOf<Task>,
      deleteState: null == deleteState
          ? _value.deleteState
          : deleteState // ignore: cast_nullable_to_non_nullable
              as OperationStatus,
    ));
  }
}

/// @nodoc

class _$TaskViewerStateImpl implements _TaskViewerState {
  const _$TaskViewerStateImpl(
      {required this.id,
      required this.task,
      this.deleteState = const OperationStatusInitial()});

  @override
  final int id;
  @override
  final StatusOf<Task> task;
  @override
  @JsonKey()
  final OperationStatus deleteState;

  @override
  String toString() {
    return 'TaskViewerState(id: $id, task: $task, deleteState: $deleteState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskViewerStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.deleteState, deleteState) ||
                other.deleteState == deleteState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, task, deleteState);

  /// Create a copy of TaskViewerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskViewerStateImplCopyWith<_$TaskViewerStateImpl> get copyWith =>
      __$$TaskViewerStateImplCopyWithImpl<_$TaskViewerStateImpl>(
          this, _$identity);
}

abstract class _TaskViewerState implements TaskViewerState {
  const factory _TaskViewerState(
      {required final int id,
      required final StatusOf<Task> task,
      final OperationStatus deleteState}) = _$TaskViewerStateImpl;

  @override
  int get id;
  @override
  StatusOf<Task> get task;
  @override
  OperationStatus get deleteState;

  /// Create a copy of TaskViewerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskViewerStateImplCopyWith<_$TaskViewerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
