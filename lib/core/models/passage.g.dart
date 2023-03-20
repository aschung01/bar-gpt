// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Passage _$$_PassageFromJson(Map<String, dynamic> json) => _$_Passage(
      id: json['id'] as int,
      content: json['content'] as String,
      tag: json['tag'] as String?,
      order: json['order'] as int?,
      hasQuestions: json['has_questions'] as bool,
    );

Map<String, dynamic> _$$_PassageToJson(_$_Passage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'tag': instance.tag,
      'order': instance.order,
      'has_questions': instance.hasQuestions,
    };
