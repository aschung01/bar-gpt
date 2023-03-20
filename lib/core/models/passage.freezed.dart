// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'passage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Passage _$PassageFromJson(Map<String, dynamic> json) {
  return _Passage.fromJson(json);
}

/// @nodoc
mixin _$Passage {
  int get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_questions')
  bool get hasQuestions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassageCopyWith<Passage> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassageCopyWith<$Res> {
  factory $PassageCopyWith(Passage value, $Res Function(Passage) then) =
      _$PassageCopyWithImpl<$Res, Passage>;
  @useResult
  $Res call(
      {int id,
      String content,
      String? tag,
      int? order,
      @JsonKey(name: 'has_questions') bool hasQuestions});
}

/// @nodoc
class _$PassageCopyWithImpl<$Res, $Val extends Passage>
    implements $PassageCopyWith<$Res> {
  _$PassageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? tag = freezed,
    Object? order = freezed,
    Object? hasQuestions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      hasQuestions: null == hasQuestions
          ? _value.hasQuestions
          : hasQuestions // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PassageCopyWith<$Res> implements $PassageCopyWith<$Res> {
  factory _$$_PassageCopyWith(
          _$_Passage value, $Res Function(_$_Passage) then) =
      __$$_PassageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String content,
      String? tag,
      int? order,
      @JsonKey(name: 'has_questions') bool hasQuestions});
}

/// @nodoc
class __$$_PassageCopyWithImpl<$Res>
    extends _$PassageCopyWithImpl<$Res, _$_Passage>
    implements _$$_PassageCopyWith<$Res> {
  __$$_PassageCopyWithImpl(_$_Passage _value, $Res Function(_$_Passage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? tag = freezed,
    Object? order = freezed,
    Object? hasQuestions = null,
  }) {
    return _then(_$_Passage(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      hasQuestions: null == hasQuestions
          ? _value.hasQuestions
          : hasQuestions // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Passage with DiagnosticableTreeMixin implements _Passage {
  const _$_Passage(
      {required this.id,
      required this.content,
      required this.tag,
      required this.order,
      @JsonKey(name: 'has_questions') required this.hasQuestions});

  factory _$_Passage.fromJson(Map<String, dynamic> json) =>
      _$$_PassageFromJson(json);

  @override
  final int id;
  @override
  final String content;
  @override
  final String? tag;
  @override
  final int? order;
  @override
  @JsonKey(name: 'has_questions')
  final bool hasQuestions;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Passage(id: $id, content: $content, tag: $tag, order: $order, hasQuestions: $hasQuestions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Passage'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('tag', tag))
      ..add(DiagnosticsProperty('order', order))
      ..add(DiagnosticsProperty('hasQuestions', hasQuestions));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Passage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.hasQuestions, hasQuestions) ||
                other.hasQuestions == hasQuestions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, content, tag, order, hasQuestions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PassageCopyWith<_$_Passage> get copyWith =>
      __$$_PassageCopyWithImpl<_$_Passage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PassageToJson(
      this,
    );
  }
}

abstract class _Passage implements Passage {
  const factory _Passage(
          {required final int id,
          required final String content,
          required final String? tag,
          required final int? order,
          @JsonKey(name: 'has_questions') required final bool hasQuestions}) =
      _$_Passage;

  factory _Passage.fromJson(Map<String, dynamic> json) = _$_Passage.fromJson;

  @override
  int get id;
  @override
  String get content;
  @override
  String? get tag;
  @override
  int? get order;
  @override
  @JsonKey(name: 'has_questions')
  bool get hasQuestions;
  @override
  @JsonKey(ignore: true)
  _$$_PassageCopyWith<_$_Passage> get copyWith =>
      throw _privateConstructorUsedError;
}
