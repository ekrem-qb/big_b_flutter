// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TasksEvent {}

/// @nodoc
abstract class $TasksEventCopyWith<$Res> {
  factory $TasksEventCopyWith(
          TasksEvent value, $Res Function(TasksEvent) then) =
      _$TasksEventCopyWithImpl<$Res, TasksEvent>;
}

/// @nodoc
class _$TasksEventCopyWithImpl<$Res, $Val extends TasksEvent>
    implements $TasksEventCopyWith<$Res> {
  _$TasksEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TasksEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TasksEventLoadRequestedImplCopyWith<$Res> {
  factory _$$TasksEventLoadRequestedImplCopyWith(
          _$TasksEventLoadRequestedImpl value,
          $Res Function(_$TasksEventLoadRequestedImpl) then) =
      __$$TasksEventLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TasksEventLoadRequestedImplCopyWithImpl<$Res>
    extends _$TasksEventCopyWithImpl<$Res, _$TasksEventLoadRequestedImpl>
    implements _$$TasksEventLoadRequestedImplCopyWith<$Res> {
  __$$TasksEventLoadRequestedImplCopyWithImpl(
      _$TasksEventLoadRequestedImpl _value,
      $Res Function(_$TasksEventLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TasksEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TasksEventLoadRequestedImpl implements TasksEventLoadRequested {
  const _$TasksEventLoadRequestedImpl();

  @override
  String toString() {
    return 'TasksEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksEventLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class TasksEventLoadRequested implements TasksEvent {
  const factory TasksEventLoadRequested() = _$TasksEventLoadRequestedImpl;
}

/// @nodoc
mixin _$TasksState {}

/// @nodoc
abstract class $TasksStateCopyWith<$Res> {
  factory $TasksStateCopyWith(
          TasksState value, $Res Function(TasksState) then) =
      _$TasksStateCopyWithImpl<$Res, TasksState>;
}

/// @nodoc
class _$TasksStateCopyWithImpl<$Res, $Val extends TasksState>
    implements $TasksStateCopyWith<$Res> {
  _$TasksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TasksStateDataImplCopyWith<$Res> {
  factory _$$TasksStateDataImplCopyWith(_$TasksStateDataImpl value,
          $Res Function(_$TasksStateDataImpl) then) =
      __$$TasksStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Task> tasks});
}

/// @nodoc
class __$$TasksStateDataImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksStateDataImpl>
    implements _$$TasksStateDataImplCopyWith<$Res> {
  __$$TasksStateDataImplCopyWithImpl(
      _$TasksStateDataImpl _value, $Res Function(_$TasksStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$TasksStateDataImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

class _$TasksStateDataImpl implements TasksStateData {
  const _$TasksStateDataImpl({required final List<Task> tasks})
      : _tasks = tasks;

  final List<Task> _tasks;
  @override
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TasksState.data(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksStateDataImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksStateDataImplCopyWith<_$TasksStateDataImpl> get copyWith =>
      __$$TasksStateDataImplCopyWithImpl<_$TasksStateDataImpl>(
          this, _$identity);
}

abstract class TasksStateData implements TasksState {
  const factory TasksStateData({required final List<Task> tasks}) =
      _$TasksStateDataImpl;

  List<Task> get tasks;

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TasksStateDataImplCopyWith<_$TasksStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TasksStateLoadingImplCopyWith<$Res> {
  factory _$$TasksStateLoadingImplCopyWith(_$TasksStateLoadingImpl value,
          $Res Function(_$TasksStateLoadingImpl) then) =
      __$$TasksStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TasksStateLoadingImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksStateLoadingImpl>
    implements _$$TasksStateLoadingImplCopyWith<$Res> {
  __$$TasksStateLoadingImplCopyWithImpl(_$TasksStateLoadingImpl _value,
      $Res Function(_$TasksStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TasksStateLoadingImpl implements TasksStateLoading {
  const _$TasksStateLoadingImpl();

  @override
  String toString() {
    return 'TasksState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TasksStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class TasksStateLoading implements TasksState {
  const factory TasksStateLoading() = _$TasksStateLoadingImpl;
}

/// @nodoc
abstract class _$$TasksStateErrorImplCopyWith<$Res> {
  factory _$$TasksStateErrorImplCopyWith(_$TasksStateErrorImpl value,
          $Res Function(_$TasksStateErrorImpl) then) =
      __$$TasksStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$TasksStateErrorImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksStateErrorImpl>
    implements _$$TasksStateErrorImplCopyWith<$Res> {
  __$$TasksStateErrorImplCopyWithImpl(
      _$TasksStateErrorImpl _value, $Res Function(_$TasksStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$TasksStateErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TasksStateErrorImpl implements TasksStateError {
  const _$TasksStateErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'TasksState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksStateErrorImplCopyWith<_$TasksStateErrorImpl> get copyWith =>
      __$$TasksStateErrorImplCopyWithImpl<_$TasksStateErrorImpl>(
          this, _$identity);
}

abstract class TasksStateError implements TasksState {
  const factory TasksStateError({required final String error}) =
      _$TasksStateErrorImpl;

  String get error;

  /// Create a copy of TasksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TasksStateErrorImplCopyWith<_$TasksStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
