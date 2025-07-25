// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  @JsonKey(includeToJson: false)
  int get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;
  Duration get delay => throw _privateConstructorUsedError;
  bool get isImageRequired => throw _privateConstructorUsedError;
  Uri? get imageUrl =>
      throw _privateConstructorUsedError; // ignore: always_put_required_named_parameters_first
  @JsonKey(includeToJson: false)
  List<Profile> get executives => throw _privateConstructorUsedError;

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call({
    @JsonKey(includeToJson: false) int id,
    String text,
    bool isDone,
    DateTime updatedAt,
    DateTime deadline,
    Duration delay,
    bool isImageRequired,
    Uri? imageUrl,
    @JsonKey(includeToJson: false) List<Profile> executives,
  });
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? isDone = null,
    Object? updatedAt = null,
    Object? deadline = null,
    Object? delay = null,
    Object? isImageRequired = null,
    Object? imageUrl = freezed,
    Object? executives = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            text:
                null == text
                    ? _value.text
                    : text // ignore: cast_nullable_to_non_nullable
                        as String,
            isDone:
                null == isDone
                    ? _value.isDone
                    : isDone // ignore: cast_nullable_to_non_nullable
                        as bool,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            deadline:
                null == deadline
                    ? _value.deadline
                    : deadline // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            delay:
                null == delay
                    ? _value.delay
                    : delay // ignore: cast_nullable_to_non_nullable
                        as Duration,
            isImageRequired:
                null == isImageRequired
                    ? _value.isImageRequired
                    : isImageRequired // ignore: cast_nullable_to_non_nullable
                        as bool,
            imageUrl:
                freezed == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as Uri?,
            executives:
                null == executives
                    ? _value.executives
                    : executives // ignore: cast_nullable_to_non_nullable
                        as List<Profile>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
    _$TaskImpl value,
    $Res Function(_$TaskImpl) then,
  ) = __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(includeToJson: false) int id,
    String text,
    bool isDone,
    DateTime updatedAt,
    DateTime deadline,
    Duration delay,
    bool isImageRequired,
    Uri? imageUrl,
    @JsonKey(includeToJson: false) List<Profile> executives,
  });
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
    : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? isDone = null,
    Object? updatedAt = null,
    Object? deadline = null,
    Object? delay = null,
    Object? isImageRequired = null,
    Object? imageUrl = freezed,
    Object? executives = null,
  }) {
    return _then(
      _$TaskImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        text:
            null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                    as String,
        isDone:
            null == isDone
                ? _value.isDone
                : isDone // ignore: cast_nullable_to_non_nullable
                    as bool,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        deadline:
            null == deadline
                ? _value.deadline
                : deadline // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        delay:
            null == delay
                ? _value.delay
                : delay // ignore: cast_nullable_to_non_nullable
                    as Duration,
        isImageRequired:
            null == isImageRequired
                ? _value.isImageRequired
                : isImageRequired // ignore: cast_nullable_to_non_nullable
                    as bool,
        imageUrl:
            freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as Uri?,
        executives:
            null == executives
                ? _value._executives
                : executives // ignore: cast_nullable_to_non_nullable
                    as List<Profile>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl implements _Task {
  const _$TaskImpl({
    @JsonKey(includeToJson: false) required this.id,
    required this.text,
    required this.isDone,
    required this.updatedAt,
    required this.deadline,
    required this.delay,
    required this.isImageRequired,
    this.imageUrl,
    @JsonKey(includeToJson: false) required final List<Profile> executives,
  }) : _executives = executives;

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final int id;
  @override
  final String text;
  @override
  final bool isDone;
  @override
  final DateTime updatedAt;
  @override
  final DateTime deadline;
  @override
  final Duration delay;
  @override
  final bool isImageRequired;
  @override
  final Uri? imageUrl;
  // ignore: always_put_required_named_parameters_first
  final List<Profile> _executives;
  // ignore: always_put_required_named_parameters_first
  @override
  @JsonKey(includeToJson: false)
  List<Profile> get executives {
    if (_executives is EqualUnmodifiableListView) return _executives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_executives);
  }

  @override
  String toString() {
    return 'Task(id: $id, text: $text, isDone: $isDone, updatedAt: $updatedAt, deadline: $deadline, delay: $delay, isImageRequired: $isImageRequired, imageUrl: $imageUrl, executives: $executives)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.delay, delay) || other.delay == delay) &&
            (identical(other.isImageRequired, isImageRequired) ||
                other.isImageRequired == isImageRequired) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(
              other._executives,
              _executives,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    text,
    isDone,
    updatedAt,
    deadline,
    delay,
    isImageRequired,
    imageUrl,
    const DeepCollectionEquality().hash(_executives),
  );

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(this);
  }
}

abstract class _Task implements Task {
  const factory _Task({
    @JsonKey(includeToJson: false) required final int id,
    required final String text,
    required final bool isDone,
    required final DateTime updatedAt,
    required final DateTime deadline,
    required final Duration delay,
    required final bool isImageRequired,
    final Uri? imageUrl,
    @JsonKey(includeToJson: false) required final List<Profile> executives,
  }) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  int get id;
  @override
  String get text;
  @override
  bool get isDone;
  @override
  DateTime get updatedAt;
  @override
  DateTime get deadline;
  @override
  Duration get delay;
  @override
  bool get isImageRequired;
  @override
  Uri? get imageUrl; // ignore: always_put_required_named_parameters_first
  @override
  @JsonKey(includeToJson: false)
  List<Profile> get executives;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
