// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_join.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileJoin _$ProfileJoinFromJson(Map<String, dynamic> json) {
  return _ProfileJoin.fromJson(json);
}

/// @nodoc
mixin _$ProfileJoin {
  int get id => throw _privateConstructorUsedError;
  String get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileJoinCopyWith<ProfileJoin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileJoinCopyWith<$Res> {
  factory $ProfileJoinCopyWith(
          ProfileJoin value, $Res Function(ProfileJoin) then) =
      _$ProfileJoinCopyWithImpl<$Res, ProfileJoin>;
  @useResult
  $Res call({int id, String profile});
}

/// @nodoc
class _$ProfileJoinCopyWithImpl<$Res, $Val extends ProfileJoin>
    implements $ProfileJoinCopyWith<$Res> {
  _$ProfileJoinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profile = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileJoinImplCopyWith<$Res>
    implements $ProfileJoinCopyWith<$Res> {
  factory _$$ProfileJoinImplCopyWith(
          _$ProfileJoinImpl value, $Res Function(_$ProfileJoinImpl) then) =
      __$$ProfileJoinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String profile});
}

/// @nodoc
class __$$ProfileJoinImplCopyWithImpl<$Res>
    extends _$ProfileJoinCopyWithImpl<$Res, _$ProfileJoinImpl>
    implements _$$ProfileJoinImplCopyWith<$Res> {
  __$$ProfileJoinImplCopyWithImpl(
      _$ProfileJoinImpl _value, $Res Function(_$ProfileJoinImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profile = null,
  }) {
    return _then(_$ProfileJoinImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileJoinImpl implements _ProfileJoin {
  const _$ProfileJoinImpl({required this.id, required this.profile});

  factory _$ProfileJoinImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileJoinImplFromJson(json);

  @override
  final int id;
  @override
  final String profile;

  @override
  String toString() {
    return 'ProfileJoin(id: $id, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileJoinImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileJoinImplCopyWith<_$ProfileJoinImpl> get copyWith =>
      __$$ProfileJoinImplCopyWithImpl<_$ProfileJoinImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileJoinImplToJson(
      this,
    );
  }
}

abstract class _ProfileJoin implements ProfileJoin {
  const factory _ProfileJoin(
      {required final int id,
      required final String profile}) = _$ProfileJoinImpl;

  factory _ProfileJoin.fromJson(Map<String, dynamic> json) =
      _$ProfileJoinImpl.fromJson;

  @override
  int get id;
  @override
  String get profile;
  @override
  @JsonKey(ignore: true)
  _$$ProfileJoinImplCopyWith<_$ProfileJoinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
