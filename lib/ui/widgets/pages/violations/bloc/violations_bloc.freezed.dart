// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'violations_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViolationsEvent {}

/// @nodoc
abstract class $ViolationsEventCopyWith<$Res> {
  factory $ViolationsEventCopyWith(
          ViolationsEvent value, $Res Function(ViolationsEvent) then) =
      _$ViolationsEventCopyWithImpl<$Res, ViolationsEvent>;
}

/// @nodoc
class _$ViolationsEventCopyWithImpl<$Res, $Val extends ViolationsEvent>
    implements $ViolationsEventCopyWith<$Res> {
  _$ViolationsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViolationsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ViolationsEventLoadRequestedImplCopyWith<$Res> {
  factory _$$ViolationsEventLoadRequestedImplCopyWith(
          _$ViolationsEventLoadRequestedImpl value,
          $Res Function(_$ViolationsEventLoadRequestedImpl) then) =
      __$$ViolationsEventLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ViolationsEventLoadRequestedImplCopyWithImpl<$Res>
    extends _$ViolationsEventCopyWithImpl<$Res,
        _$ViolationsEventLoadRequestedImpl>
    implements _$$ViolationsEventLoadRequestedImplCopyWith<$Res> {
  __$$ViolationsEventLoadRequestedImplCopyWithImpl(
      _$ViolationsEventLoadRequestedImpl _value,
      $Res Function(_$ViolationsEventLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViolationsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ViolationsEventLoadRequestedImpl
    with DiagnosticableTreeMixin
    implements ViolationsEventLoadRequested {
  const _$ViolationsEventLoadRequestedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViolationsEvent.loadRequested()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'ViolationsEvent.loadRequested'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViolationsEventLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ViolationsEventLoadRequested implements ViolationsEvent {
  const factory ViolationsEventLoadRequested() =
      _$ViolationsEventLoadRequestedImpl;
}

/// @nodoc
mixin _$ViolationsState {
  int? get id => throw _privateConstructorUsedError;
  StatusOf<List<Violation>> get violations =>
      throw _privateConstructorUsedError;

  /// Create a copy of ViolationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViolationsStateCopyWith<ViolationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolationsStateCopyWith<$Res> {
  factory $ViolationsStateCopyWith(
          ViolationsState value, $Res Function(ViolationsState) then) =
      _$ViolationsStateCopyWithImpl<$Res, ViolationsState>;
  @useResult
  $Res call({int? id, StatusOf<List<Violation>> violations});

  $StatusOfCopyWith<List<Violation>, $Res> get violations;
}

/// @nodoc
class _$ViolationsStateCopyWithImpl<$Res, $Val extends ViolationsState>
    implements $ViolationsStateCopyWith<$Res> {
  _$ViolationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViolationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? violations = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      violations: null == violations
          ? _value.violations
          : violations // ignore: cast_nullable_to_non_nullable
              as StatusOf<List<Violation>>,
    ) as $Val);
  }

  /// Create a copy of ViolationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusOfCopyWith<List<Violation>, $Res> get violations {
    return $StatusOfCopyWith<List<Violation>, $Res>(_value.violations, (value) {
      return _then(_value.copyWith(violations: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViolationsStateImplCopyWith<$Res>
    implements $ViolationsStateCopyWith<$Res> {
  factory _$$ViolationsStateImplCopyWith(_$ViolationsStateImpl value,
          $Res Function(_$ViolationsStateImpl) then) =
      __$$ViolationsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, StatusOf<List<Violation>> violations});

  @override
  $StatusOfCopyWith<List<Violation>, $Res> get violations;
}

/// @nodoc
class __$$ViolationsStateImplCopyWithImpl<$Res>
    extends _$ViolationsStateCopyWithImpl<$Res, _$ViolationsStateImpl>
    implements _$$ViolationsStateImplCopyWith<$Res> {
  __$$ViolationsStateImplCopyWithImpl(
      _$ViolationsStateImpl _value, $Res Function(_$ViolationsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViolationsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? violations = null,
  }) {
    return _then(_$ViolationsStateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      violations: null == violations
          ? _value.violations
          : violations // ignore: cast_nullable_to_non_nullable
              as StatusOf<List<Violation>>,
    ));
  }
}

/// @nodoc

class _$ViolationsStateImpl
    with DiagnosticableTreeMixin
    implements _ViolationsState {
  const _$ViolationsStateImpl({required this.id, required this.violations});

  @override
  final int? id;
  @override
  final StatusOf<List<Violation>> violations;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ViolationsState(id: $id, violations: $violations)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ViolationsState'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('violations', violations));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViolationsStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.violations, violations) ||
                other.violations == violations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, violations);

  /// Create a copy of ViolationsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViolationsStateImplCopyWith<_$ViolationsStateImpl> get copyWith =>
      __$$ViolationsStateImplCopyWithImpl<_$ViolationsStateImpl>(
          this, _$identity);
}

abstract class _ViolationsState implements ViolationsState {
  const factory _ViolationsState(
          {required final int? id,
          required final StatusOf<List<Violation>> violations}) =
      _$ViolationsStateImpl;

  @override
  int? get id;
  @override
  StatusOf<List<Violation>> get violations;

  /// Create a copy of ViolationsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViolationsStateImplCopyWith<_$ViolationsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
