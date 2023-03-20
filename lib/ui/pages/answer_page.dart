import 'package:bar_gpt/core/controllers/exam_controller.dart';
import 'package:bar_gpt/helpers/color_manager.dart';
import 'package:bar_gpt/helpers/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class AnswerPage extends GetView<ExamController> {
  const AnswerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.gray1,
        foregroundColor: ColorManager.gray9,
        title: FontManager.kText(
          Typo.h3,
          "${controller.currentExam?.year}년도 시행 제${controller.currentExam?.num}회 변호사시험",
        ),
      ),
      body: SafeArea(
        child: GetBuilder<ExamController>(
          builder: (_) {
            return const Center(
              child: CircularProgressIndicator(color: ColorManager.primary),
            );
          },
        ),
      ),
    );
  }
}
