// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rules_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RulesEvent {}

/// @nodoc
abstract class $RulesEventCopyWith<$Res> {
  factory $RulesEventCopyWith(
          RulesEvent value, $Res Function(RulesEvent) then) =
      _$RulesEventCopyWithImpl<$Res, RulesEvent>;
}

/// @nodoc
class _$RulesEventCopyWithImpl<$Res, $Val extends RulesEvent>
    implements $RulesEventCopyWith<$Res> {
  _$RulesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RulesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RulesEventLoadRequestedImplCopyWith<$Res> {
  factory _$$RulesEventLoadRequestedImplCopyWith(
          _$RulesEventLoadRequestedImpl value,
          $Res Function(_$RulesEventLoadRequestedImpl) then) =
      __$$RulesEventLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RulesEventLoadRequestedImplCopyWithImpl<$Res>
    extends _$RulesEventCopyWithImpl<$Res, _$RulesEventLoadRequestedImpl>
    implements _$$RulesEventLoadRequestedImplCopyWith<$Res> {
  __$$RulesEventLoadRequestedImplCopyWithImpl(
      _$RulesEventLoadRequestedImpl _value,
      $Res Function(_$RulesEventLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RulesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RulesEventLoadRequestedImpl implements RulesEventLoadRequested {
  const _$RulesEventLoadRequestedImpl();

  @override
  String toString() {
    return 'RulesEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RulesEventLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class RulesEventLoadRequested implements RulesEvent {
  const factory RulesEventLoadRequested() = _$RulesEventLoadRequestedImpl;
}

/// @nodoc
abstract class _$$RulesEventDataUpdatedImplCopyWith<$Res> {
  factory _$$RulesEventDataUpdatedImplCopyWith(
          _$RulesEventDataUpdatedImpl value,
          $Res Function(_$RulesEventDataUpdatedImpl) then) =
      __$$RulesEventDataUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PostgresChangePayload payload});
}

/// @nodoc
class __$$RulesEventDataUpdatedImplCopyWithImpl<$Res>
    extends _$RulesEventCopyWithImpl<$Res, _$RulesEventDataUpdatedImpl>
    implements _$$RulesEventDataUpdatedImplCopyWith<$Res> {
  __$$RulesEventDataUpdatedImplCopyWithImpl(_$RulesEventDataUpdatedImpl _value,
      $Res Function(_$RulesEventDataUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RulesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payload = null,
  }) {
    return _then(_$RulesEventDataUpdatedImpl(
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as PostgresChangePayload,
    ));
  }
}

/// @nodoc

class _$RulesEventDataUpdatedImpl implements _RulesEventDataUpdated {
  const _$RulesEventDataUpdatedImpl({required this.payload});

  @override
  final PostgresChangePayload payload;

  @override
  String toString() {
    return 'RulesEvent.dataUpdated(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RulesEventDataUpdatedImpl &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payload);

  /// Create a copy of RulesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RulesEventDataUpdatedImplCopyWith<_$RulesEventDataUpdatedImpl>
      get copyWith => __$$RulesEventDataUpdatedImplCopyWithImpl<
          _$RulesEventDataUpdatedImpl>(this, _$identity);
}

abstract class _RulesEventDataUpdated implements RulesEvent {
  const factory _RulesEventDataUpdated(
          {required final PostgresChangePayload payload}) =
      _$RulesEventDataUpdatedImpl;

  PostgresChangePayload get payload;

  /// Create a copy of RulesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RulesEventDataUpdatedImplCopyWith<_$RulesEventDataUpdatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RulesState {}

/// @nodoc
abstract class $RulesStateCopyWith<$Res> {
  factory $RulesStateCopyWith(
          RulesState value, $Res Function(RulesState) then) =
      _$RulesStateCopyWithImpl<$Res, RulesState>;
}

/// @nodoc
class _$RulesStateCopyWithImpl<$Res, $Val extends RulesState>
    implements $RulesStateCopyWith<$Res> {
  _$RulesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RulesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RulesStateDataImplCopyWith<$Res> {
  factory _$$RulesStateDataImplCopyWith(_$RulesStateDataImpl value,
          $Res Function(_$RulesStateDataImpl) then) =
      __$$RulesStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Rule> rules});
}

/// @nodoc
class __$$RulesStateDataImplCopyWithImpl<$Res>
    extends _$RulesStateCopyWithImpl<$Res, _$RulesStateDataImpl>
    implements _$$RulesStateDataImplCopyWith<$Res> {
  __$$RulesStateDataImplCopyWithImpl(
      _$RulesStateDataImpl _value, $Res Function(_$RulesStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RulesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rules = null,
  }) {
    return _then(_$RulesStateDataImpl(
      rules: null == rules
          ? _value._rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<Rule>,
    ));
  }
}

/// @nodoc

class _$RulesStateDataImpl implements RulesStateData {
  const _$RulesStateDataImpl({required final List<Rule> rules})
      : _rules = rules;

  final List<Rule> _rules;
  @override
  List<Rule> get rules {
    if (_rules is EqualUnmodifiableListView) return _rules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rules);
  }

  @override
  String toString() {
    return 'RulesState.data(rules: $rules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RulesStateDataImpl &&
            const DeepCollectionEquality().equals(other._rules, _rules));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rules));

  /// Create a copy of RulesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RulesStateDataImplCopyWith<_$RulesStateDataImpl> get copyWith =>
      __$$RulesStateDataImplCopyWithImpl<_$RulesStateDataImpl>(
          this, _$identity);
}

abstract class RulesStateData implements RulesState {
  const factory RulesStateData({required final List<Rule> rules}) =
      _$RulesStateDataImpl;

  List<Rule> get rules;

  /// Create a copy of RulesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RulesStateDataImplCopyWith<_$RulesStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RulesStateLoadingImplCopyWith<$Res> {
  factory _$$RulesStateLoadingImplCopyWith(_$RulesStateLoadingImpl value,
          $Res Function(_$RulesStateLoadingImpl) then) =
      __$$RulesStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RulesStateLoadingImplCopyWithImpl<$Res>
    extends _$RulesStateCopyWithImpl<$Res, _$RulesStateLoadingImpl>
    implements _$$RulesStateLoadingImplCopyWith<$Res> {
  __$$RulesStateLoadingImplCopyWithImpl(_$RulesStateLoadingImpl _value,
      $Res Function(_$RulesStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of RulesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RulesStateLoadingImpl implements RulesStateLoading {
  const _$RulesStateLoadingImpl();

  @override
  String toString() {
    return 'RulesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RulesStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class RulesStateLoading implements RulesState {
  const factory RulesStateLoading() = _$RulesStateLoadingImpl;
}

/// @nodoc
abstract class _$$RulesStateErrorImplCopyWith<$Res> {
  factory _$$RulesStateErrorImplCopyWith(_$RulesStateErrorImpl value,
          $Res Function(_$RulesStateErrorImpl) then) =
      __$$RulesStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$RulesStateErrorImplCopyWithImpl<$Res>
    extends _$RulesStateCopyWithImpl<$Res, _$RulesStateErrorImpl>
    implements _$$RulesStateErrorImplCopyWith<$Res> {
  __$$RulesStateErrorImplCopyWithImpl(
      _$RulesStateErrorImpl _value, $Res Function(_$RulesStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of RulesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$RulesStateErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RulesStateErrorImpl implements RulesStateError {
  const _$RulesStateErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'RulesState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RulesStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of RulesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RulesStateErrorImplCopyWith<_$RulesStateErrorImpl> get copyWith =>
      __$$RulesStateErrorImplCopyWithImpl<_$RulesStateErrorImpl>(
          this, _$identity);
}

abstract class RulesStateError implements RulesState {
  const factory RulesStateError({required final String error}) =
      _$RulesStateErrorImpl;

  String get error;

  /// Create a copy of RulesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RulesStateErrorImplCopyWith<_$RulesStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
