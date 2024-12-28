// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'violation_viewer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViolationViewerEvent {}

/// @nodoc
abstract class $ViolationViewerEventCopyWith<$Res> {
  factory $ViolationViewerEventCopyWith(ViolationViewerEvent value,
          $Res Function(ViolationViewerEvent) then) =
      _$ViolationViewerEventCopyWithImpl<$Res, ViolationViewerEvent>;
}

/// @nodoc
class _$ViolationViewerEventCopyWithImpl<$Res,
        $Val extends ViolationViewerEvent>
    implements $ViolationViewerEventCopyWith<$Res> {
  _$ViolationViewerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViolationViewerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ViolationViewerEventLoadRequestedImplCopyWith<$Res> {
  factory _$$ViolationViewerEventLoadRequestedImplCopyWith(
          _$ViolationViewerEventLoadRequestedImpl value,
          $Res Function(_$ViolationViewerEventLoadRequestedImpl) then) =
      __$$ViolationViewerEventLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ViolationViewerEventLoadRequestedImplCopyWithImpl<$Res>
    extends _$ViolationViewerEventCopyWithImpl<$Res,
        _$ViolationViewerEventLoadRequestedImpl>
    implements _$$ViolationViewerEventLoadRequestedImplCopyWith<$Res> {
  __$$ViolationViewerEventLoadRequestedImplCopyWithImpl(
      _$ViolationViewerEventLoadRequestedImpl _value,
      $Res Function(_$ViolationViewerEventLoadRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViolationViewerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ViolationViewerEventLoadRequestedImpl
    implements ViolationViewerEventLoadRequested {
  const _$ViolationViewerEventLoadRequestedImpl();

  @override
  String toString() {
    return 'ViolationViewerEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViolationViewerEventLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class ViolationViewerEventLoadRequested
    implements ViolationViewerEvent {
  const factory ViolationViewerEventLoadRequested() =
      _$ViolationViewerEventLoadRequestedImpl;
}

/// @nodoc
mixin _$ViolationViewerState {
  int get id => throw _privateConstructorUsedError;
  StatusOf<Violation, String> get violation =>
      throw _privateConstructorUsedError;

  /// Create a copy of ViolationViewerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViolationViewerStateCopyWith<ViolationViewerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolationViewerStateCopyWith<$Res> {
  factory $ViolationViewerStateCopyWith(ViolationViewerState value,
          $Res Function(ViolationViewerState) then) =
      _$ViolationViewerStateCopyWithImpl<$Res, ViolationViewerState>;
  @useResult
  $Res call({int id, StatusOf<Violation, String> violation});

  $StatusOfCopyWith<Violation, String, $Res> get violation;
}

/// @nodoc
class _$ViolationViewerStateCopyWithImpl<$Res,
        $Val extends ViolationViewerState>
    implements $ViolationViewerStateCopyWith<$Res> {
  _$ViolationViewerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViolationViewerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? violation = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      violation: null == violation
          ? _value.violation
          : violation // ignore: cast_nullable_to_non_nullable
              as StatusOf<Violation, String>,
    ) as $Val);
  }

  /// Create a copy of ViolationViewerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusOfCopyWith<Violation, String, $Res> get violation {
    return $StatusOfCopyWith<Violation, String, $Res>(_value.violation,
        (value) {
      return _then(_value.copyWith(violation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViolationViewerStateImplCopyWith<$Res>
    implements $ViolationViewerStateCopyWith<$Res> {
  factory _$$ViolationViewerStateImplCopyWith(_$ViolationViewerStateImpl value,
          $Res Function(_$ViolationViewerStateImpl) then) =
      __$$ViolationViewerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, StatusOf<Violation, String> violation});

  @override
  $StatusOfCopyWith<Violation, String, $Res> get violation;
}

/// @nodoc
class __$$ViolationViewerStateImplCopyWithImpl<$Res>
    extends _$ViolationViewerStateCopyWithImpl<$Res, _$ViolationViewerStateImpl>
    implements _$$ViolationViewerStateImplCopyWith<$Res> {
  __$$ViolationViewerStateImplCopyWithImpl(_$ViolationViewerStateImpl _value,
      $Res Function(_$ViolationViewerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViolationViewerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? violation = null,
  }) {
    return _then(_$ViolationViewerStateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      violation: null == violation
          ? _value.violation
          : violation // ignore: cast_nullable_to_non_nullable
              as StatusOf<Violation, String>,
    ));
  }
}

/// @nodoc

class _$ViolationViewerStateImpl implements _ViolationViewerState {
  const _$ViolationViewerStateImpl({required this.id, required this.violation});

  @override
  final int id;
  @override
  final StatusOf<Violation, String> violation;

  @override
  String toString() {
    return 'ViolationViewerState(id: $id, violation: $violation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViolationViewerStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.violation, violation) ||
                other.violation == violation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, violation);

  /// Create a copy of ViolationViewerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViolationViewerStateImplCopyWith<_$ViolationViewerStateImpl>
      get copyWith =>
          __$$ViolationViewerStateImplCopyWithImpl<_$ViolationViewerStateImpl>(
              this, _$identity);
}

abstract class _ViolationViewerState implements ViolationViewerState {
  const factory _ViolationViewerState(
          {required final int id,
          required final StatusOf<Violation, String> violation}) =
      _$ViolationViewerStateImpl;

  @override
  int get id;
  @override
  StatusOf<Violation, String> get violation;

  /// Create a copy of ViolationViewerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViolationViewerStateImplCopyWith<_$ViolationViewerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
