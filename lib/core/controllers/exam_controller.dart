import 'package:bar_gpt/core/models/answer.dart';
import 'package:bar_gpt/core/models/exam.dart';
import 'package:bar_gpt/core/models/passage.dart';
import 'package:bar_gpt/core/models/question.dart';
import 'package:bar_gpt/core/models/question_group.dart';
import 'package:bar_gpt/core/services/supabase_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ExamController extends GetxController {
  static ExamController to = Get.find<ExamController>();

  RxBool loading = false.obs;
  RxList<Object> examDataList = <Object>[].obs;
  RxMap<int, bool> showAnswerMap = <int, bool>{}.obs;
  RxMap<int, List<Answer>> answerMap = <int, List<Answer>>{}.obs;
  // RxMap<int, List<PreviewData>> answerReferencePreviewDataMap = <int, List<PreviewData>>{}.obs;
  Exam? currentExam;
  // RxList<QuestionGroup> questionGroupList = <QuestionGroup>[].obs;

  Future<void> initExam(Exam exam) async {
    loading.value = true;
    currentExam = exam;
    examDataList.clear();

    List<QuestionGroup> questionGroupRes =
        await SupabaseService.getQuestionGroupList(exam.id);

    for (QuestionGroup questionGroup in questionGroupRes) {
      examDataList.add(questionGroup);

      List<Passage> passageRes =
          await SupabaseService.getPassageList(questionGroup.id);

      examDataList.addAll(passageRes);

      for (Passage passage in passageRes) {
        if (passage.hasQuestions) {
          List<Question> questionRes =
              await SupabaseService.getQuestionList(passage.id);

          examDataList.insertAll(
              examDataList.indexOf(passage) + 1, questionRes);
        }
      }

      if (passageRes.isEmpty) {
        examDataList.addAll(
            await SupabaseService.getQuestionListWithQuestionGroupId(
                questionGroup.id));
      }
    }
    loading.value = false;
  }

  Future<void> getAnswerListForQuestion(int questionId) async {
    answerMap[questionId] =
        await SupabaseService.getAnswerListWithQuestionId(questionId);
  }
}
