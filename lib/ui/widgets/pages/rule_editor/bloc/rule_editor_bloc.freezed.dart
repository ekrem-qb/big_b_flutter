// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rule_editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RuleEditorEvent {}

/// @nodoc
abstract class $RuleEditorEventCopyWith<$Res> {
  factory $RuleEditorEventCopyWith(
          RuleEditorEvent value, $Res Function(RuleEditorEvent) then) =
      _$RuleEditorEventCopyWithImpl<$Res, RuleEditorEvent>;
}

/// @nodoc
class _$RuleEditorEventCopyWithImpl<$Res, $Val extends RuleEditorEvent>
    implements $RuleEditorEventCopyWith<$Res> {
  _$RuleEditorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RuleEditorEventLoadRequestedImplCopyWith<$Res> {
  factory _$$RuleEditorEventLoadRequestedImplCopyWith(
          _$RuleEditorEventLoadRequestedImpl value,
          $Res Function(_$RuleEditorEventLoadRequestedImpl) then) =
      __$$RuleEditorEventLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RuleEditorEventLoadRequestedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res,
        _$RuleEditorEventLoadRequestedImpl>
    implements _$$RuleEditorEventLoadRequestedImplCopyWith<$Res> {
  __$$RuleEditorEventLoadRequestedImplCopyWithImpl(
      _$RuleEditorEventLoadRequestedImpl _value,
      $Res Function(_$RuleEditorEventLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RuleEditorEventLoadRequestedImpl
    implements RuleEditorEventLoadRequested {
  const _$RuleEditorEventLoadRequestedImpl();

  @override
  String toString() {
    return 'RuleEditorEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class RuleEditorEventLoadRequested implements RuleEditorEvent {
  const factory RuleEditorEventLoadRequested() =
      _$RuleEditorEventLoadRequestedImpl;
}

/// @nodoc
abstract class _$$RuleEditorEventTypeChangedImplCopyWith<$Res> {
  factory _$$RuleEditorEventTypeChangedImplCopyWith(
          _$RuleEditorEventTypeChangedImpl value,
          $Res Function(_$RuleEditorEventTypeChangedImpl) then) =
      __$$RuleEditorEventTypeChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Rule value});

  $RuleCopyWith<$Res> get value;
}

/// @nodoc
class __$$RuleEditorEventTypeChangedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res,
        _$RuleEditorEventTypeChangedImpl>
    implements _$$RuleEditorEventTypeChangedImplCopyWith<$Res> {
  __$$RuleEditorEventTypeChangedImplCopyWithImpl(
      _$RuleEditorEventTypeChangedImpl _value,
      $Res Function(_$RuleEditorEventTypeChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$RuleEditorEventTypeChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Rule,
    ));
  }

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RuleCopyWith<$Res> get value {
    return $RuleCopyWith<$Res>(_value.value, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc

class _$RuleEditorEventTypeChangedImpl implements RuleEditorEventTypeChanged {
  const _$RuleEditorEventTypeChangedImpl(this.value);

  @override
  final Rule value;

  @override
  String toString() {
    return 'RuleEditorEvent.typeChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventTypeChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorEventTypeChangedImplCopyWith<_$RuleEditorEventTypeChangedImpl>
      get copyWith => __$$RuleEditorEventTypeChangedImplCopyWithImpl<
          _$RuleEditorEventTypeChangedImpl>(this, _$identity);
}

abstract class RuleEditorEventTypeChanged implements RuleEditorEvent {
  const factory RuleEditorEventTypeChanged(final Rule value) =
      _$RuleEditorEventTypeChangedImpl;

  Rule get value;

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorEventTypeChangedImplCopyWith<_$RuleEditorEventTypeChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RuleEditorEventWordsAddedImplCopyWith<$Res> {
  factory _$$RuleEditorEventWordsAddedImplCopyWith(
          _$RuleEditorEventWordsAddedImpl value,
          $Res Function(_$RuleEditorEventWordsAddedImpl) then) =
      __$$RuleEditorEventWordsAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Iterable<String> value});
}

/// @nodoc
class __$$RuleEditorEventWordsAddedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res, _$RuleEditorEventWordsAddedImpl>
    implements _$$RuleEditorEventWordsAddedImplCopyWith<$Res> {
  __$$RuleEditorEventWordsAddedImplCopyWithImpl(
      _$RuleEditorEventWordsAddedImpl _value,
      $Res Function(_$RuleEditorEventWordsAddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$RuleEditorEventWordsAddedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Iterable<String>,
    ));
  }
}

/// @nodoc

class _$RuleEditorEventWordsAddedImpl implements RuleEditorEventWordsAdded {
  const _$RuleEditorEventWordsAddedImpl(this.value);

  @override
  final Iterable<String> value;

  @override
  String toString() {
    return 'RuleEditorEvent.wordsAdded(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventWordsAddedImpl &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorEventWordsAddedImplCopyWith<_$RuleEditorEventWordsAddedImpl>
      get copyWith => __$$RuleEditorEventWordsAddedImplCopyWithImpl<
          _$RuleEditorEventWordsAddedImpl>(this, _$identity);
}

abstract class RuleEditorEventWordsAdded implements RuleEditorEvent {
  const factory RuleEditorEventWordsAdded(final Iterable<String> value) =
      _$RuleEditorEventWordsAddedImpl;

  Iterable<String> get value;

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorEventWordsAddedImplCopyWith<_$RuleEditorEventWordsAddedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RuleEditorEventWordRemovedImplCopyWith<$Res> {
  factory _$$RuleEditorEventWordRemovedImplCopyWith(
          _$RuleEditorEventWordRemovedImpl value,
          $Res Function(_$RuleEditorEventWordRemovedImpl) then) =
      __$$RuleEditorEventWordRemovedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$RuleEditorEventWordRemovedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res,
        _$RuleEditorEventWordRemovedImpl>
    implements _$$RuleEditorEventWordRemovedImplCopyWith<$Res> {
  __$$RuleEditorEventWordRemovedImplCopyWithImpl(
      _$RuleEditorEventWordRemovedImpl _value,
      $Res Function(_$RuleEditorEventWordRemovedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$RuleEditorEventWordRemovedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RuleEditorEventWordRemovedImpl implements RuleEditorEventWordRemoved {
  const _$RuleEditorEventWordRemovedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'RuleEditorEvent.wordRemoved(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventWordRemovedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorEventWordRemovedImplCopyWith<_$RuleEditorEventWordRemovedImpl>
      get copyWith => __$$RuleEditorEventWordRemovedImplCopyWithImpl<
          _$RuleEditorEventWordRemovedImpl>(this, _$identity);
}

abstract class RuleEditorEventWordRemoved implements RuleEditorEvent {
  const factory RuleEditorEventWordRemoved(final String value) =
      _$RuleEditorEventWordRemovedImpl;

  String get value;

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorEventWordRemovedImplCopyWith<_$RuleEditorEventWordRemovedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RuleEditorEventDescriptionChangedImplCopyWith<$Res> {
  factory _$$RuleEditorEventDescriptionChangedImplCopyWith(
          _$RuleEditorEventDescriptionChangedImpl value,
          $Res Function(_$RuleEditorEventDescriptionChangedImpl) then) =
      __$$RuleEditorEventDescriptionChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$RuleEditorEventDescriptionChangedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res,
        _$RuleEditorEventDescriptionChangedImpl>
    implements _$$RuleEditorEventDescriptionChangedImplCopyWith<$Res> {
  __$$RuleEditorEventDescriptionChangedImplCopyWithImpl(
      _$RuleEditorEventDescriptionChangedImpl _value,
      $Res Function(_$RuleEditorEventDescriptionChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$RuleEditorEventDescriptionChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RuleEditorEventDescriptionChangedImpl
    implements RuleEditorEventDescriptionChanged {
  const _$RuleEditorEventDescriptionChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'RuleEditorEvent.descriptionChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventDescriptionChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorEventDescriptionChangedImplCopyWith<
          _$RuleEditorEventDescriptionChangedImpl>
      get copyWith => __$$RuleEditorEventDescriptionChangedImplCopyWithImpl<
          _$RuleEditorEventDescriptionChangedImpl>(this, _$identity);
}

abstract class RuleEditorEventDescriptionChanged implements RuleEditorEvent {
  const factory RuleEditorEventDescriptionChanged(final String value) =
      _$RuleEditorEventDescriptionChangedImpl;

  String get value;

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorEventDescriptionChangedImplCopyWith<
          _$RuleEditorEventDescriptionChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RuleEditorEventDetailsChangedImplCopyWith<$Res> {
  factory _$$RuleEditorEventDetailsChangedImplCopyWith(
          _$RuleEditorEventDetailsChangedImpl value,
          $Res Function(_$RuleEditorEventDetailsChangedImpl) then) =
      __$$RuleEditorEventDetailsChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$RuleEditorEventDetailsChangedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res,
        _$RuleEditorEventDetailsChangedImpl>
    implements _$$RuleEditorEventDetailsChangedImplCopyWith<$Res> {
  __$$RuleEditorEventDetailsChangedImplCopyWithImpl(
      _$RuleEditorEventDetailsChangedImpl _value,
      $Res Function(_$RuleEditorEventDetailsChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$RuleEditorEventDetailsChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RuleEditorEventDetailsChangedImpl
    implements RuleEditorEventDetailsChanged {
  const _$RuleEditorEventDetailsChangedImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'RuleEditorEvent.detailsChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventDetailsChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorEventDetailsChangedImplCopyWith<
          _$RuleEditorEventDetailsChangedImpl>
      get copyWith => __$$RuleEditorEventDetailsChangedImplCopyWithImpl<
          _$RuleEditorEventDetailsChangedImpl>(this, _$identity);
}

abstract class RuleEditorEventDetailsChanged implements RuleEditorEvent {
  const factory RuleEditorEventDetailsChanged(final String value) =
      _$RuleEditorEventDetailsChangedImpl;

  String get value;

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorEventDetailsChangedImplCopyWith<
          _$RuleEditorEventDetailsChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RuleEditorEventColorChangedImplCopyWith<$Res> {
  factory _$$RuleEditorEventColorChangedImplCopyWith(
          _$RuleEditorEventColorChangedImpl value,
          $Res Function(_$RuleEditorEventColorChangedImpl) then) =
      __$$RuleEditorEventColorChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Color value});
}

/// @nodoc
class __$$RuleEditorEventColorChangedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res,
        _$RuleEditorEventColorChangedImpl>
    implements _$$RuleEditorEventColorChangedImplCopyWith<$Res> {
  __$$RuleEditorEventColorChangedImplCopyWithImpl(
      _$RuleEditorEventColorChangedImpl _value,
      $Res Function(_$RuleEditorEventColorChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$RuleEditorEventColorChangedImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$RuleEditorEventColorChangedImpl implements RuleEditorEventColorChanged {
  const _$RuleEditorEventColorChangedImpl(this.value);

  @override
  final Color value;

  @override
  String toString() {
    return 'RuleEditorEvent.colorChanged(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventColorChangedImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorEventColorChangedImplCopyWith<_$RuleEditorEventColorChangedImpl>
      get copyWith => __$$RuleEditorEventColorChangedImplCopyWithImpl<
          _$RuleEditorEventColorChangedImpl>(this, _$identity);
}

abstract class RuleEditorEventColorChanged implements RuleEditorEvent {
  const factory RuleEditorEventColorChanged(final Color value) =
      _$RuleEditorEventColorChangedImpl;

  Color get value;

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorEventColorChangedImplCopyWith<_$RuleEditorEventColorChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RuleEditorEventSaveRequestedImplCopyWith<$Res> {
  factory _$$RuleEditorEventSaveRequestedImplCopyWith(
          _$RuleEditorEventSaveRequestedImpl value,
          $Res Function(_$RuleEditorEventSaveRequestedImpl) then) =
      __$$RuleEditorEventSaveRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RuleEditorEventSaveRequestedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res,
        _$RuleEditorEventSaveRequestedImpl>
    implements _$$RuleEditorEventSaveRequestedImplCopyWith<$Res> {
  __$$RuleEditorEventSaveRequestedImplCopyWithImpl(
      _$RuleEditorEventSaveRequestedImpl _value,
      $Res Function(_$RuleEditorEventSaveRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RuleEditorEventSaveRequestedImpl
    implements RuleEditorEventSaveRequested {
  const _$RuleEditorEventSaveRequestedImpl();

  @override
  String toString() {
    return 'RuleEditorEvent.saveRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventSaveRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class RuleEditorEventSaveRequested implements RuleEditorEvent {
  const factory RuleEditorEventSaveRequested() =
      _$RuleEditorEventSaveRequestedImpl;
}

/// @nodoc
abstract class _$$RuleEditorEventDeleteRequestedImplCopyWith<$Res> {
  factory _$$RuleEditorEventDeleteRequestedImplCopyWith(
          _$RuleEditorEventDeleteRequestedImpl value,
          $Res Function(_$RuleEditorEventDeleteRequestedImpl) then) =
      __$$RuleEditorEventDeleteRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RuleEditorEventDeleteRequestedImplCopyWithImpl<$Res>
    extends _$RuleEditorEventCopyWithImpl<$Res,
        _$RuleEditorEventDeleteRequestedImpl>
    implements _$$RuleEditorEventDeleteRequestedImplCopyWith<$Res> {
  __$$RuleEditorEventDeleteRequestedImplCopyWithImpl(
      _$RuleEditorEventDeleteRequestedImpl _value,
      $Res Function(_$RuleEditorEventDeleteRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RuleEditorEventDeleteRequestedImpl
    implements RuleEditorEventDeleteRequested {
  const _$RuleEditorEventDeleteRequestedImpl();

  @override
  String toString() {
    return 'RuleEditorEvent.deleteRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorEventDeleteRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class RuleEditorEventDeleteRequested implements RuleEditorEvent {
  const factory RuleEditorEventDeleteRequested() =
      _$RuleEditorEventDeleteRequestedImpl;
}

/// @nodoc
mixin _$RuleEditorState {}

/// @nodoc
abstract class $RuleEditorStateCopyWith<$Res> {
  factory $RuleEditorStateCopyWith(
          RuleEditorState value, $Res Function(RuleEditorState) then) =
      _$RuleEditorStateCopyWithImpl<$Res, RuleEditorState>;
}

/// @nodoc
class _$RuleEditorStateCopyWithImpl<$Res, $Val extends RuleEditorState>
    implements $RuleEditorStateCopyWith<$Res> {
  _$RuleEditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RuleEditorStateCreateImplCopyWith<$Res> {
  factory _$$RuleEditorStateCreateImplCopyWith(
          _$RuleEditorStateCreateImpl value,
          $Res Function(_$RuleEditorStateCreateImpl) then) =
      __$$RuleEditorStateCreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Rule rule,
      String? descriptionError,
      OperationStatus<String> uploadState});

  $RuleCopyWith<$Res> get rule;
  $OperationStatusCopyWith<String, $Res> get uploadState;
}

/// @nodoc
class __$$RuleEditorStateCreateImplCopyWithImpl<$Res>
    extends _$RuleEditorStateCopyWithImpl<$Res, _$RuleEditorStateCreateImpl>
    implements _$$RuleEditorStateCreateImplCopyWith<$Res> {
  __$$RuleEditorStateCreateImplCopyWithImpl(_$RuleEditorStateCreateImpl _value,
      $Res Function(_$RuleEditorStateCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rule = null,
    Object? descriptionError = freezed,
    Object? uploadState = null,
  }) {
    return _then(_$RuleEditorStateCreateImpl(
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as Rule,
      descriptionError: freezed == descriptionError
          ? _value.descriptionError
          : descriptionError // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadState: null == uploadState
          ? _value.uploadState
          : uploadState // ignore: cast_nullable_to_non_nullable
              as OperationStatus<String>,
    ));
  }

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RuleCopyWith<$Res> get rule {
    return $RuleCopyWith<$Res>(_value.rule, (value) {
      return _then(_value.copyWith(rule: value));
    });
  }

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperationStatusCopyWith<String, $Res> get uploadState {
    return $OperationStatusCopyWith<String, $Res>(_value.uploadState, (value) {
      return _then(_value.copyWith(uploadState: value));
    });
  }
}

/// @nodoc

class _$RuleEditorStateCreateImpl implements RuleEditorStateCreate {
  const _$RuleEditorStateCreateImpl(
      {this.rule = const WordsRule(id: -1, color: Colors.red, words: {}),
      this.descriptionError,
      this.uploadState = const OperationStatusInitial()});

  @override
  @JsonKey()
  final Rule rule;
  @override
  final String? descriptionError;
  @override
  @JsonKey()
  final OperationStatus<String> uploadState;

  @override
  String toString() {
    return 'RuleEditorState.create(rule: $rule, descriptionError: $descriptionError, uploadState: $uploadState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorStateCreateImpl &&
            (identical(other.rule, rule) || other.rule == rule) &&
            (identical(other.descriptionError, descriptionError) ||
                other.descriptionError == descriptionError) &&
            (identical(other.uploadState, uploadState) ||
                other.uploadState == uploadState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, rule, descriptionError, uploadState);

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorStateCreateImplCopyWith<_$RuleEditorStateCreateImpl>
      get copyWith => __$$RuleEditorStateCreateImplCopyWithImpl<
          _$RuleEditorStateCreateImpl>(this, _$identity);
}

abstract class RuleEditorStateCreate implements RuleEditorState {
  const factory RuleEditorStateCreate(
      {final Rule rule,
      final String? descriptionError,
      final OperationStatus<String> uploadState}) = _$RuleEditorStateCreateImpl;

  Rule get rule;
  String? get descriptionError;
  OperationStatus<String> get uploadState;

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorStateCreateImplCopyWith<_$RuleEditorStateCreateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RuleEditorStateEditImplCopyWith<$Res> {
  factory _$$RuleEditorStateEditImplCopyWith(_$RuleEditorStateEditImpl value,
          $Res Function(_$RuleEditorStateEditImpl) then) =
      __$$RuleEditorStateEditImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, StatusOf<RuleEditorStateEditState, String> editState});

  $StatusOfCopyWith<RuleEditorStateEditState, String, $Res> get editState;
}

/// @nodoc
class __$$RuleEditorStateEditImplCopyWithImpl<$Res>
    extends _$RuleEditorStateCopyWithImpl<$Res, _$RuleEditorStateEditImpl>
    implements _$$RuleEditorStateEditImplCopyWith<$Res> {
  __$$RuleEditorStateEditImplCopyWithImpl(_$RuleEditorStateEditImpl _value,
      $Res Function(_$RuleEditorStateEditImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? editState = null,
  }) {
    return _then(_$RuleEditorStateEditImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      editState: null == editState
          ? _value.editState
          : editState // ignore: cast_nullable_to_non_nullable
              as StatusOf<RuleEditorStateEditState, String>,
    ));
  }

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusOfCopyWith<RuleEditorStateEditState, String, $Res> get editState {
    return $StatusOfCopyWith<RuleEditorStateEditState, String, $Res>(
        _value.editState, (value) {
      return _then(_value.copyWith(editState: value));
    });
  }
}

/// @nodoc

class _$RuleEditorStateEditImpl implements RuleEditorStateEdit {
  const _$RuleEditorStateEditImpl(
      {required this.id, this.editState = const StatusOfLoading()});

  @override
  final int id;
  @override
  @JsonKey()
  final StatusOf<RuleEditorStateEditState, String> editState;

  @override
  String toString() {
    return 'RuleEditorState.edit(id: $id, editState: $editState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorStateEditImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.editState, editState) ||
                other.editState == editState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, editState);

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorStateEditImplCopyWith<_$RuleEditorStateEditImpl> get copyWith =>
      __$$RuleEditorStateEditImplCopyWithImpl<_$RuleEditorStateEditImpl>(
          this, _$identity);
}

abstract class RuleEditorStateEdit implements RuleEditorState {
  const factory RuleEditorStateEdit(
          {required final int id,
          final StatusOf<RuleEditorStateEditState, String> editState}) =
      _$RuleEditorStateEditImpl;

  int get id;
  StatusOf<RuleEditorStateEditState, String> get editState;

  /// Create a copy of RuleEditorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorStateEditImplCopyWith<_$RuleEditorStateEditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RuleEditorStateEditState {
  Rule get rule => throw _privateConstructorUsedError;
  String? get descriptionError => throw _privateConstructorUsedError;
  OperationStatus<String> get uploadState => throw _privateConstructorUsedError;
  OperationStatus<String> get deleteState => throw _privateConstructorUsedError;

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RuleEditorStateEditStateCopyWith<RuleEditorStateEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuleEditorStateEditStateCopyWith<$Res> {
  factory $RuleEditorStateEditStateCopyWith(RuleEditorStateEditState value,
          $Res Function(RuleEditorStateEditState) then) =
      _$RuleEditorStateEditStateCopyWithImpl<$Res, RuleEditorStateEditState>;
  @useResult
  $Res call(
      {Rule rule,
      String? descriptionError,
      OperationStatus<String> uploadState,
      OperationStatus<String> deleteState});

  $RuleCopyWith<$Res> get rule;
  $OperationStatusCopyWith<String, $Res> get uploadState;
  $OperationStatusCopyWith<String, $Res> get deleteState;
}

/// @nodoc
class _$RuleEditorStateEditStateCopyWithImpl<$Res,
        $Val extends RuleEditorStateEditState>
    implements $RuleEditorStateEditStateCopyWith<$Res> {
  _$RuleEditorStateEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rule = null,
    Object? descriptionError = freezed,
    Object? uploadState = null,
    Object? deleteState = null,
  }) {
    return _then(_value.copyWith(
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as Rule,
      descriptionError: freezed == descriptionError
          ? _value.descriptionError
          : descriptionError // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadState: null == uploadState
          ? _value.uploadState
          : uploadState // ignore: cast_nullable_to_non_nullable
              as OperationStatus<String>,
      deleteState: null == deleteState
          ? _value.deleteState
          : deleteState // ignore: cast_nullable_to_non_nullable
              as OperationStatus<String>,
    ) as $Val);
  }

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RuleCopyWith<$Res> get rule {
    return $RuleCopyWith<$Res>(_value.rule, (value) {
      return _then(_value.copyWith(rule: value) as $Val);
    });
  }

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperationStatusCopyWith<String, $Res> get uploadState {
    return $OperationStatusCopyWith<String, $Res>(_value.uploadState, (value) {
      return _then(_value.copyWith(uploadState: value) as $Val);
    });
  }

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OperationStatusCopyWith<String, $Res> get deleteState {
    return $OperationStatusCopyWith<String, $Res>(_value.deleteState, (value) {
      return _then(_value.copyWith(deleteState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RuleEditorStateEditStateImplCopyWith<$Res>
    implements $RuleEditorStateEditStateCopyWith<$Res> {
  factory _$$RuleEditorStateEditStateImplCopyWith(
          _$RuleEditorStateEditStateImpl value,
          $Res Function(_$RuleEditorStateEditStateImpl) then) =
      __$$RuleEditorStateEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Rule rule,
      String? descriptionError,
      OperationStatus<String> uploadState,
      OperationStatus<String> deleteState});

  @override
  $RuleCopyWith<$Res> get rule;
  @override
  $OperationStatusCopyWith<String, $Res> get uploadState;
  @override
  $OperationStatusCopyWith<String, $Res> get deleteState;
}

/// @nodoc
class __$$RuleEditorStateEditStateImplCopyWithImpl<$Res>
    extends _$RuleEditorStateEditStateCopyWithImpl<$Res,
        _$RuleEditorStateEditStateImpl>
    implements _$$RuleEditorStateEditStateImplCopyWith<$Res> {
  __$$RuleEditorStateEditStateImplCopyWithImpl(
      _$RuleEditorStateEditStateImpl _value,
      $Res Function(_$RuleEditorStateEditStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rule = null,
    Object? descriptionError = freezed,
    Object? uploadState = null,
    Object? deleteState = null,
  }) {
    return _then(_$RuleEditorStateEditStateImpl(
      rule: null == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as Rule,
      descriptionError: freezed == descriptionError
          ? _value.descriptionError
          : descriptionError // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadState: null == uploadState
          ? _value.uploadState
          : uploadState // ignore: cast_nullable_to_non_nullable
              as OperationStatus<String>,
      deleteState: null == deleteState
          ? _value.deleteState
          : deleteState // ignore: cast_nullable_to_non_nullable
              as OperationStatus<String>,
    ));
  }
}

/// @nodoc

class _$RuleEditorStateEditStateImpl implements _RuleEditorStateEditState {
  const _$RuleEditorStateEditStateImpl(
      {required this.rule,
      this.descriptionError,
      this.uploadState = const OperationStatusInitial(),
      this.deleteState = const OperationStatusInitial()});

  @override
  final Rule rule;
  @override
  final String? descriptionError;
  @override
  @JsonKey()
  final OperationStatus<String> uploadState;
  @override
  @JsonKey()
  final OperationStatus<String> deleteState;

  @override
  String toString() {
    return 'RuleEditorStateEditState(rule: $rule, descriptionError: $descriptionError, uploadState: $uploadState, deleteState: $deleteState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleEditorStateEditStateImpl &&
            (identical(other.rule, rule) || other.rule == rule) &&
            (identical(other.descriptionError, descriptionError) ||
                other.descriptionError == descriptionError) &&
            (identical(other.uploadState, uploadState) ||
                other.uploadState == uploadState) &&
            (identical(other.deleteState, deleteState) ||
                other.deleteState == deleteState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, rule, descriptionError, uploadState, deleteState);

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleEditorStateEditStateImplCopyWith<_$RuleEditorStateEditStateImpl>
      get copyWith => __$$RuleEditorStateEditStateImplCopyWithImpl<
          _$RuleEditorStateEditStateImpl>(this, _$identity);
}

abstract class _RuleEditorStateEditState implements RuleEditorStateEditState {
  const factory _RuleEditorStateEditState(
          {required final Rule rule,
          final String? descriptionError,
          final OperationStatus<String> uploadState,
          final OperationStatus<String> deleteState}) =
      _$RuleEditorStateEditStateImpl;

  @override
  Rule get rule;
  @override
  String? get descriptionError;
  @override
  OperationStatus<String> get uploadState;
  @override
  OperationStatus<String> get deleteState;

  /// Create a copy of RuleEditorStateEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RuleEditorStateEditStateImplCopyWith<_$RuleEditorStateEditStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
