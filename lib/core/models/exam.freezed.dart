// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Exam _$ExamFromJson(Map<String, dynamic> json) {
  return _Exam.fromJson(json);
}

/// @nodoc
mixin _$Exam {
  int get id => throw _privateConstructorUsedError;
  int get num => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExamCopyWith<Exam> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamCopyWith<$Res> {
  factory $ExamCopyWith(Exam value, $Res Function(Exam) then) =
      _$ExamCopyWithImpl<$Res, Exam>;
  @useResult
  $Res call({int id, int num, int year, String category, String type});
}

/// @nodoc
class _$ExamCopyWithImpl<$Res, $Val extends Exam>
    implements $ExamCopyWith<$Res> {
  _$ExamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? num = null,
    Object? year = null,
    Object? category = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      num: null == num
          ? _value.num
          : num // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExamCopyWith<$Res> implements $ExamCopyWith<$Res> {
  factory _$$_ExamCopyWith(_$_Exam value, $Res Function(_$_Exam) then) =
      __$$_ExamCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int num, int year, String category, String type});
}

/// @nodoc
class __$$_ExamCopyWithImpl<$Res> extends _$ExamCopyWithImpl<$Res, _$_Exam>
    implements _$$_ExamCopyWith<$Res> {
  __$$_ExamCopyWithImpl(_$_Exam _value, $Res Function(_$_Exam) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? num = null,
    Object? year = null,
    Object? category = null,
    Object? type = null,
  }) {
    return _then(_$_Exam(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      num: null == num
          ? _value.num
          : num // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Exam with DiagnosticableTreeMixin implements _Exam {
  const _$_Exam(
      {required this.id,
      required this.num,
      required this.year,
      required this.category,
      required this.type});

  factory _$_Exam.fromJson(Map<String, dynamic> json) => _$$_ExamFromJson(json);

  @override
  final int id;
  @override
  final int num;
  @override
  final int year;
  @override
  final String category;
  @override
  final String type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Exam(id: $id, num: $num, year: $year, category: $category, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Exam'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('num', num))
      ..add(DiagnosticsProperty('year', year))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Exam &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.num, num) || other.num == num) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, num, year, category, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExamCopyWith<_$_Exam> get copyWith =>
      __$$_ExamCopyWithImpl<_$_Exam>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExamToJson(
      this,
    );
  }
}

abstract class _Exam implements Exam {
  const factory _Exam(
      {required final int id,
      required final int num,
      required final int year,
      required final String category,
      required final String type}) = _$_Exam;

  factory _Exam.fromJson(Map<String, dynamic> json) = _$_Exam.fromJson;

  @override
  int get id;
  @override
  int get num;
  @override
  int get year;
  @override
  String get category;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_ExamCopyWith<_$_Exam> get copyWith => throw _privateConstructorUsedError;
}
