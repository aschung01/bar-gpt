import 'package:bar_gpt/constants/app_routes.dart';
import 'package:bar_gpt/core/controllers/exam_controller.dart';
import 'package:bar_gpt/core/controllers/main_controller.dart';
import 'package:bar_gpt/core/models/exam.dart';
import 'package:bar_gpt/helpers/color_manager.dart';
import 'package:bar_gpt/helpers/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: Center(
          child: SingleChildScrollView(
            child: GetX<MainController>(
              builder: (_) {
                print(_.examList);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    _.examList.length,
                    (index) => ExamListItem(
                      exam: _.examList[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ExamListItem extends StatelessWidget {
  final Exam exam;
  const ExamListItem({
    super.key,
    required this.exam,
  });

  void onTap() {
    Get.toNamed(Routes.exam);
    ExamController.to.initExam(exam);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.gray1,
          borderRadius: BorderRadius.circular(20),
        ),
        constraints: BoxConstraints(
          maxWidth: context.width * 0.8,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: FontManager.kText(
                Typo.h4,
                "${exam.year}년도 시행 제${exam.num}회 변호사시험",
              ),
            ),
            Expanded(
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: FontManager.kText(
                        Typo.h5,
                        exam.category,
                      ),
                    ),
                    const VerticalDivider(
                      color: ColorManager.gray5,
                      thickness: 2,
                      width: 16,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: FontManager.kText(Typo.h5, exam.type),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
