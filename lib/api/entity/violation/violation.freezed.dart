// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'violation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Violation _$ViolationFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'normal':
      return NormalViolation.fromJson(json);
    case 'highlight':
      return HighlightViolation.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'type',
        'Violation',
        'Invalid union type "${json['type']}"!',
      );
  }
}

/// @nodoc
mixin _$Violation {
  int get id => throw _privateConstructorUsedError;
  Rule get rule => throw _privateConstructorUsedError;
  Recording get record => throw _privateConstructorUsedError;

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViolationCopyWith<Violation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolationCopyWith<$Res> {
  factory $ViolationCopyWith(Violation value, $Res Function(Violation) then) =
      _$ViolationCopyWithImpl<$Res, Violation>;
  @useResult
  $Res call({int id, Rule rule, Recording record});

  $RuleCopyWith<$Res> get rule;
  $RecordingCopyWith<$Res> get record;
}

/// @nodoc
class _$ViolationCopyWithImpl<$Res, $Val extends Violation>
    implements $ViolationCopyWith<$Res> {
  _$ViolationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? rule = null, Object? record = null}) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            rule:
                null == rule
                    ? _value.rule
                    : rule // ignore: cast_nullable_to_non_nullable
                        as Rule,
            record:
                null == record
                    ? _value.record
                    : record // ignore: cast_nullable_to_non_nullable
                        as Recording,
          )
          as $Val,
    );
  }

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RuleCopyWith<$Res> get rule {
    return $RuleCopyWith<$Res>(_value.rule, (value) {
      return _then(_value.copyWith(rule: value) as $Val);
    });
  }

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecordingCopyWith<$Res> get record {
    return $RecordingCopyWith<$Res>(_value.record, (value) {
      return _then(_value.copyWith(record: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NormalViolationImplCopyWith<$Res>
    implements $ViolationCopyWith<$Res> {
  factory _$$NormalViolationImplCopyWith(
    _$NormalViolationImpl value,
    $Res Function(_$NormalViolationImpl) then,
  ) = __$$NormalViolationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Rule rule, Recording record});

  @override
  $RuleCopyWith<$Res> get rule;
  @override
  $RecordingCopyWith<$Res> get record;
}

/// @nodoc
class __$$NormalViolationImplCopyWithImpl<$Res>
    extends _$ViolationCopyWithImpl<$Res, _$NormalViolationImpl>
    implements _$$NormalViolationImplCopyWith<$Res> {
  __$$NormalViolationImplCopyWithImpl(
    _$NormalViolationImpl _value,
    $Res Function(_$NormalViolationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? rule = null, Object? record = null}) {
    return _then(
      _$NormalViolationImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        rule:
            null == rule
                ? _value.rule
                : rule // ignore: cast_nullable_to_non_nullable
                    as Rule,
        record:
            null == record
                ? _value.record
                : record // ignore: cast_nullable_to_non_nullable
                    as Recording,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$NormalViolationImpl implements NormalViolation {
  _$NormalViolationImpl({
    required this.id,
    required this.rule,
    required this.record,
    final String? $type,
  }) : $type = $type ?? 'normal';

  factory _$NormalViolationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NormalViolationImplFromJson(json);

  @override
  final int id;
  @override
  final Rule rule;
  @override
  final Recording record;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Violation.normal(id: $id, rule: $rule, record: $record)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NormalViolationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rule, rule) || other.rule == rule) &&
            (identical(other.record, record) || other.record == record));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, rule, record);

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NormalViolationImplCopyWith<_$NormalViolationImpl> get copyWith =>
      __$$NormalViolationImplCopyWithImpl<_$NormalViolationImpl>(
        this,
        _$identity,
      );
}

abstract class NormalViolation implements Violation {
  factory NormalViolation({
    required final int id,
    required final Rule rule,
    required final Recording record,
  }) = _$NormalViolationImpl;

  factory NormalViolation.fromJson(Map<String, dynamic> json) =
      _$NormalViolationImpl.fromJson;

  @override
  int get id;
  @override
  Rule get rule;
  @override
  Recording get record;

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NormalViolationImplCopyWith<_$NormalViolationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HighlightViolationImplCopyWith<$Res>
    implements $ViolationCopyWith<$Res> {
  factory _$$HighlightViolationImplCopyWith(
    _$HighlightViolationImpl value,
    $Res Function(_$HighlightViolationImpl) then,
  ) = __$$HighlightViolationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    Rule rule,
    Recording record,
    TextLine line,
    int startIndex,
    int endIndex,
  });

  @override
  $RuleCopyWith<$Res> get rule;
  @override
  $RecordingCopyWith<$Res> get record;
  $TextLineCopyWith<$Res> get line;
}

/// @nodoc
class __$$HighlightViolationImplCopyWithImpl<$Res>
    extends _$ViolationCopyWithImpl<$Res, _$HighlightViolationImpl>
    implements _$$HighlightViolationImplCopyWith<$Res> {
  __$$HighlightViolationImplCopyWithImpl(
    _$HighlightViolationImpl _value,
    $Res Function(_$HighlightViolationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rule = null,
    Object? record = null,
    Object? line = null,
    Object? startIndex = null,
    Object? endIndex = null,
  }) {
    return _then(
      _$HighlightViolationImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        rule:
            null == rule
                ? _value.rule
                : rule // ignore: cast_nullable_to_non_nullable
                    as Rule,
        record:
            null == record
                ? _value.record
                : record // ignore: cast_nullable_to_non_nullable
                    as Recording,
        line:
            null == line
                ? _value.line
                : line // ignore: cast_nullable_to_non_nullable
                    as TextLine,
        startIndex:
            null == startIndex
                ? _value.startIndex
                : startIndex // ignore: cast_nullable_to_non_nullable
                    as int,
        endIndex:
            null == endIndex
                ? _value.endIndex
                : endIndex // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TextLineCopyWith<$Res> get line {
    return $TextLineCopyWith<$Res>(_value.line, (value) {
      return _then(_value.copyWith(line: value));
    });
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$HighlightViolationImpl implements HighlightViolation {
  _$HighlightViolationImpl({
    required this.id,
    required this.rule,
    required this.record,
    required this.line,
    required this.startIndex,
    required this.endIndex,
    final String? $type,
  }) : $type = $type ?? 'highlight';

  factory _$HighlightViolationImpl.fromJson(Map<String, dynamic> json) =>
      _$$HighlightViolationImplFromJson(json);

  @override
  final int id;
  @override
  final Rule rule;
  @override
  final Recording record;
  @override
  final TextLine line;
  @override
  final int startIndex;
  @override
  final int endIndex;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Violation.highlight(id: $id, rule: $rule, record: $record, line: $line, startIndex: $startIndex, endIndex: $endIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HighlightViolationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rule, rule) || other.rule == rule) &&
            (identical(other.record, record) || other.record == record) &&
            (identical(other.line, line) || other.line == line) &&
            (identical(other.startIndex, startIndex) ||
                other.startIndex == startIndex) &&
            (identical(other.endIndex, endIndex) ||
                other.endIndex == endIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, rule, record, line, startIndex, endIndex);

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HighlightViolationImplCopyWith<_$HighlightViolationImpl> get copyWith =>
      __$$HighlightViolationImplCopyWithImpl<_$HighlightViolationImpl>(
        this,
        _$identity,
      );
}

abstract class HighlightViolation implements Violation {
  factory HighlightViolation({
    required final int id,
    required final Rule rule,
    required final Recording record,
    required final TextLine line,
    required final int startIndex,
    required final int endIndex,
  }) = _$HighlightViolationImpl;

  factory HighlightViolation.fromJson(Map<String, dynamic> json) =
      _$HighlightViolationImpl.fromJson;

  @override
  int get id;
  @override
  Rule get rule;
  @override
  Recording get record;
  TextLine get line;
  int get startIndex;
  int get endIndex;

  /// Create a copy of Violation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HighlightViolationImplCopyWith<_$HighlightViolationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
