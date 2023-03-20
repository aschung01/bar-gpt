// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionGroup _$QuestionGroupFromJson(Map<String, dynamic> json) {
  return _QuestionGroup.fromJson(json);
}

/// @nodoc
mixin _$QuestionGroup {
  int get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionGroupCopyWith<QuestionGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionGroupCopyWith<$Res> {
  factory $QuestionGroupCopyWith(
          QuestionGroup value, $Res Function(QuestionGroup) then) =
      _$QuestionGroupCopyWithImpl<$Res, QuestionGroup>;
  @useResult
  $Res call({int id, String label});
}

/// @nodoc
class _$QuestionGroupCopyWithImpl<$Res, $Val extends QuestionGroup>
    implements $QuestionGroupCopyWith<$Res> {
  _$QuestionGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionGroupCopyWith<$Res>
    implements $QuestionGroupCopyWith<$Res> {
  factory _$$_QuestionGroupCopyWith(
          _$_QuestionGroup value, $Res Function(_$_QuestionGroup) then) =
      __$$_QuestionGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String label});
}

/// @nodoc
class __$$_QuestionGroupCopyWithImpl<$Res>
    extends _$QuestionGroupCopyWithImpl<$Res, _$_QuestionGroup>
    implements _$$_QuestionGroupCopyWith<$Res> {
  __$$_QuestionGroupCopyWithImpl(
      _$_QuestionGroup _value, $Res Function(_$_QuestionGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
  }) {
    return _then(_$_QuestionGroup(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionGroup with DiagnosticableTreeMixin implements _QuestionGroup {
  const _$_QuestionGroup({required this.id, required this.label});

  factory _$_QuestionGroup.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionGroupFromJson(json);

  @override
  final int id;
  @override
  final String label;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QuestionGroup(id: $id, label: $label)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QuestionGroup'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionGroupCopyWith<_$_QuestionGroup> get copyWith =>
      __$$_QuestionGroupCopyWithImpl<_$_QuestionGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionGroupToJson(
      this,
    );
  }
}

abstract class _QuestionGroup implements QuestionGroup {
  const factory _QuestionGroup(
      {required final int id, required final String label}) = _$_QuestionGroup;

  factory _QuestionGroup.fromJson(Map<String, dynamic> json) =
      _$_QuestionGroup.fromJson;

  @override
  int get id;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionGroupCopyWith<_$_QuestionGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
