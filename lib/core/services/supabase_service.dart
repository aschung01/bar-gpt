import 'package:bar_gpt/core/models/answer.dart';
import 'package:bar_gpt/core/models/exam.dart';
import 'package:bar_gpt/core/models/passage.dart';
import 'package:bar_gpt/core/models/question.dart';
import 'package:bar_gpt/core/models/question_group.dart';
import 'package:bar_gpt/helpers/secret.dart';
import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bar_gpt/constants/constants.dart' as constants;

class SupabaseService {
  static final supabase = Supabase.instance.client;
  static final logger = Logger();

  static Future<void> init() async {
    await Supabase.initialize(
      url: await SecretLoader(secretPath: constants.secretsPath)
          .load()
          .then((secret) => secret.supabaseUrl),
      anonKey: await SecretLoader(secretPath: constants.secretsPath)
          .load()
          .then((secret) => secret.supabaseAnonKey),
    );
  }

  static Future<List<Exam>> getExamList() async {
    try {
      final response = await supabase.from('exam').select();
      logger.d(response);

      return response
          .map((exam) => Exam.fromJson(exam))
          .toList(growable: false)
          .cast<Exam>();
    } catch (e) {
      logger.w(e, e);
      return [];
    }
  }

  static Future<List<QuestionGroup>> getQuestionGroupList(int examId) async {
    try {
      final response = await supabase
          .from('question_group')
          .select('id, label')
          .eq('exam_id', examId);
      logger.d(response);

      return response
          .map((questionGroup) => QuestionGroup.fromJson(questionGroup))
          .toList(growable: false)
          .cast<QuestionGroup>();
    } catch (e) {
      logger.w(e, e);
      return [];
    }
  }

  static Future<List<Passage>> getPassageList(int questionGroupId) async {
    try {
      final response = await supabase
          .from('passage')
          .select('id, tag, content, has_questions')
          .eq('question_group_id', questionGroupId)
          .order('order', ascending: true);
      logger.d(response);

      return response
          .map((passage) => Passage.fromJson(passage))
          .toList(growable: false)
          .cast<Passage>();
    } catch (e) {
      logger.w(e, e);
      return [];
    }
  }

  static Future<List<Question>> getQuestionList(int passageId) async {
    try {
      final response = await supabase
          .from('question')
          .select('id, content, total_score, num, supported')
          .eq('passage_id', passageId)
          .order('num', ascending: true);
      logger.d(response);

      return response
          .map((question) => Question.fromJson(question))
          .toList(growable: false)
          .cast<Question>();
    } catch (e) {
      logger.w(e, e);
      return [];
    }
  }

  static Future<List<Question>> getQuestionListWithQuestionGroupId(
      int questionGroupId) async {
    try {
      final response = await supabase
          .from('question')
          .select('id, content, total_score, num, supported')
          .eq('question_group_id', questionGroupId)
          .order('num', ascending: true);
      logger.d(response);

      return response
          .map((question) => Question.fromJson(question))
          .toList(growable: false)
          .cast<Question>();
    } catch (e) {
      logger.w(e, e);
      return [];
    }
  }

  static Future<List<Answer>> getAnswerListWithQuestionId(
      int questionId) async {
    try {
      logger.i(questionId);
      final response = await supabase
          .from('answer')
          .select('id, content, reference_urls')
          .eq('question_id', questionId);
      logger.d(response);

      return response
          .map((answer) => Answer.fromJson(answer))
          .toList(growable: false)
          .cast<Answer>();
    } catch (e) {
      logger.w(e, e);
      return [];
    }
  }
}
