// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Rule _$RuleFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'words':
      return WordsRule.fromJson(json);
    case 'name':
      return NameRule.fromJson(json);
    case 'custom':
      return CustomRule.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'Rule', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$Rule {
  @JsonKey(includeToJson: false)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Color.new, toJson: colorToJson)
  Color get color => throw _privateConstructorUsedError;

  /// Serializes this Rule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RuleCopyWith<Rule> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuleCopyWith<$Res> {
  factory $RuleCopyWith(Rule value, $Res Function(Rule) then) =
      _$RuleCopyWithImpl<$Res, Rule>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int id,
      @JsonKey(fromJson: Color.new, toJson: colorToJson) Color color});
}

/// @nodoc
class _$RuleCopyWithImpl<$Res, $Val extends Rule>
    implements $RuleCopyWith<$Res> {
  _$RuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordsRuleImplCopyWith<$Res> implements $RuleCopyWith<$Res> {
  factory _$$WordsRuleImplCopyWith(
          _$WordsRuleImpl value, $Res Function(_$WordsRuleImpl) then) =
      __$$WordsRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int id,
      Set<String> words,
      @JsonKey(fromJson: Color.new, toJson: colorToJson) Color color});
}

/// @nodoc
class __$$WordsRuleImplCopyWithImpl<$Res>
    extends _$RuleCopyWithImpl<$Res, _$WordsRuleImpl>
    implements _$$WordsRuleImplCopyWith<$Res> {
  __$$WordsRuleImplCopyWithImpl(
      _$WordsRuleImpl _value, $Res Function(_$WordsRuleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? words = null,
    Object? color = null,
  }) {
    return _then(_$WordsRuleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordsRuleImpl implements WordsRule {
  const _$WordsRuleImpl(
      {@JsonKey(includeToJson: false) required this.id,
      required final Set<String> words,
      @JsonKey(fromJson: Color.new, toJson: colorToJson) required this.color,
      final String? $type})
      : _words = words,
        $type = $type ?? 'words';

  factory _$WordsRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordsRuleImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final int id;
  final Set<String> _words;
  @override
  Set<String> get words {
    if (_words is EqualUnmodifiableSetView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_words);
  }

  @override
  @JsonKey(fromJson: Color.new, toJson: colorToJson)
  final Color color;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Rule.words(id: $id, words: $words, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordsRuleImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_words), color);

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordsRuleImplCopyWith<_$WordsRuleImpl> get copyWith =>
      __$$WordsRuleImplCopyWithImpl<_$WordsRuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordsRuleImplToJson(
      this,
    );
  }
}

abstract class WordsRule implements Rule {
  const factory WordsRule(
      {@JsonKey(includeToJson: false) required final int id,
      required final Set<String> words,
      @JsonKey(fromJson: Color.new, toJson: colorToJson)
      required final Color color}) = _$WordsRuleImpl;

  factory WordsRule.fromJson(Map<String, dynamic> json) =
      _$WordsRuleImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  int get id;
  Set<String> get words;
  @override
  @JsonKey(fromJson: Color.new, toJson: colorToJson)
  Color get color;

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordsRuleImplCopyWith<_$WordsRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NameRuleImplCopyWith<$Res> implements $RuleCopyWith<$Res> {
  factory _$$NameRuleImplCopyWith(
          _$NameRuleImpl value, $Res Function(_$NameRuleImpl) then) =
      __$$NameRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int id,
      @JsonKey(fromJson: Color.new, toJson: colorToJson) Color color});
}

/// @nodoc
class __$$NameRuleImplCopyWithImpl<$Res>
    extends _$RuleCopyWithImpl<$Res, _$NameRuleImpl>
    implements _$$NameRuleImplCopyWith<$Res> {
  __$$NameRuleImplCopyWithImpl(
      _$NameRuleImpl _value, $Res Function(_$NameRuleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? color = null,
  }) {
    return _then(_$NameRuleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NameRuleImpl implements NameRule {
  const _$NameRuleImpl(
      {@JsonKey(includeToJson: false) required this.id,
      @JsonKey(fromJson: Color.new, toJson: colorToJson) required this.color,
      final String? $type})
      : $type = $type ?? 'name';

  factory _$NameRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$NameRuleImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final int id;
  @override
  @JsonKey(fromJson: Color.new, toJson: colorToJson)
  final Color color;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Rule.name(id: $id, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameRuleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, color);

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NameRuleImplCopyWith<_$NameRuleImpl> get copyWith =>
      __$$NameRuleImplCopyWithImpl<_$NameRuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NameRuleImplToJson(
      this,
    );
  }
}

abstract class NameRule implements Rule {
  const factory NameRule(
      {@JsonKey(includeToJson: false) required final int id,
      @JsonKey(fromJson: Color.new, toJson: colorToJson)
      required final Color color}) = _$NameRuleImpl;

  factory NameRule.fromJson(Map<String, dynamic> json) =
      _$NameRuleImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  int get id;
  @override
  @JsonKey(fromJson: Color.new, toJson: colorToJson)
  Color get color;

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NameRuleImplCopyWith<_$NameRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomRuleImplCopyWith<$Res> implements $RuleCopyWith<$Res> {
  factory _$$CustomRuleImplCopyWith(
          _$CustomRuleImpl value, $Res Function(_$CustomRuleImpl) then) =
      __$$CustomRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int id,
      String description,
      String details,
      @JsonKey(fromJson: Color.new, toJson: colorToJson) Color color});
}

/// @nodoc
class __$$CustomRuleImplCopyWithImpl<$Res>
    extends _$RuleCopyWithImpl<$Res, _$CustomRuleImpl>
    implements _$$CustomRuleImplCopyWith<$Res> {
  __$$CustomRuleImplCopyWithImpl(
      _$CustomRuleImpl _value, $Res Function(_$CustomRuleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? details = null,
    Object? color = null,
  }) {
    return _then(_$CustomRuleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomRuleImpl implements CustomRule {
  const _$CustomRuleImpl(
      {@JsonKey(includeToJson: false) required this.id,
      required this.description,
      required this.details,
      @JsonKey(fromJson: Color.new, toJson: colorToJson) required this.color,
      final String? $type})
      : $type = $type ?? 'custom';

  factory _$CustomRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomRuleImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final int id;
  @override
  final String description;
  @override
  final String details;
  @override
  @JsonKey(fromJson: Color.new, toJson: colorToJson)
  final Color color;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'Rule.custom(id: $id, description: $description, details: $details, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomRuleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, description, details, color);

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomRuleImplCopyWith<_$CustomRuleImpl> get copyWith =>
      __$$CustomRuleImplCopyWithImpl<_$CustomRuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomRuleImplToJson(
      this,
    );
  }
}

abstract class CustomRule implements Rule {
  const factory CustomRule(
      {@JsonKey(includeToJson: false) required final int id,
      required final String description,
      required final String details,
      @JsonKey(fromJson: Color.new, toJson: colorToJson)
      required final Color color}) = _$CustomRuleImpl;

  factory CustomRule.fromJson(Map<String, dynamic> json) =
      _$CustomRuleImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  int get id;
  String get description;
  String get details;
  @override
  @JsonKey(fromJson: Color.new, toJson: colorToJson)
  Color get color;

  /// Create a copy of Rule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomRuleImplCopyWith<_$CustomRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
