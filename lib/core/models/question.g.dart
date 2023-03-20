// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Question _$$_QuestionFromJson(Map<String, dynamic> json) => _$_Question(
      id: json['id'] as int,
      content: json['content'] as String,
      totalScore: json['total_score'] as int?,
      examId: json['exam_id'] as int?,
      num: json['num'] as int?,
      supported: json['supported'] as bool,
    );

Map<String, dynamic> _$$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'total_score': instance.totalScore,
      'exam_id': instance.examId,
      'num': instance.num,
      'supported': instance.supported,
    };
