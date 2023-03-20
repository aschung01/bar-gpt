import 'package:any_link_preview/any_link_preview.dart';
import 'package:bar_gpt/constants/app_routes.dart';
import 'package:bar_gpt/core/controllers/chat_controller.dart';
import 'package:bar_gpt/core/models/answer.dart';
import 'package:bar_gpt/core/models/passage.dart';
import 'package:bar_gpt/core/models/question.dart';
import 'package:bar_gpt/core/models/question_group.dart';
import 'package:bar_gpt/core/services/supabase_service.dart';
import 'package:bar_gpt/helpers/color_manager.dart';
import 'package:bar_gpt/helpers/font_manager.dart';
import 'package:bar_gpt/helpers/url_launcher.dart';
import 'package:bar_gpt/ui/widgets/buttons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bar_gpt/core/controllers/exam_controller.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const String questionLabel = "< 문제 >";

class ExamView extends GetView<ExamController> {
  const ExamView({super.key});

  void onViewAnswerPressed(Question question) {
    controller.showAnswerMap[question.id] = true;
    if (controller.answerMap[question.id] == null) {
      controller.getAnswerListForQuestion(question.id);
    }
    controller.update();
  }

  void onHideAnswerPressed(Question question) {
    controller.showAnswerMap[question.id] = false;
    controller.update();
  }

  void onSendChatPressed(Answer answer) {
    ChatController.to.initChat(answer);
    Get.toNamed(Routes.chat);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
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
        child: GetX<ExamController>(
          builder: (_) {
            if (_.loading.value) {
              return const Center(
                child: CircularProgressIndicator(color: ColorManager.primary),
              );
            } else {
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shrinkWrap: true,
                itemCount: _.examDataList.length,
                itemBuilder: (context, index) {
                  Object obj = _.examDataList[index];
                  if (obj is QuestionGroup) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 16),
                      child: FontManager.kText(Typo.h3, "< ${obj.label} >"),
                    );
                  } else if (obj is Passage) {
                    if (obj.tag != null) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FontManager.kText(Typo.p2, "< ${obj.tag!} >"),
                            FontManager.kText(Typo.p, obj.content),
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: FontManager.kText(Typo.p, obj.content),
                      );
                    }
                  } else if (obj is Question) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          (obj.num == null || obj.num == 1)
                              ? FontManager.kText(Typo.p2, questionLabel)
                              : const SizedBox.shrink(),
                          () {
                            String text = "${obj.content} (${obj.totalScore}점)";
                            if (obj.num != null) {
                              text = "${obj.num}. $text";
                            }
                            return FontManager.kText(
                              Typo.p,
                              text,
                            );
                          }(),
                          GetBuilder<ExamController>(
                            builder: (_) {
                              if (obj.supported) {
                                if (_.showAnswerMap[obj.id] == true) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: TextActionButton(
                                      buttonText: "가리기",
                                      textColor: ColorManager.primary,
                                      onPressed: () => onHideAnswerPressed(obj),
                                      isUnderlined: false,
                                      height: 40,
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: TextActionButton(
                                      buttonText: "모범 답안 보기",
                                      textColor: ColorManager.primary,
                                      onPressed: () => onViewAnswerPressed(obj),
                                      isUnderlined: false,
                                      height: 40,
                                    ),
                                  );
                                }
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: FontManager.kText(
                                    Typo.label,
                                    "준비중인 문제입니다",
                                  ),
                                );
                              }
                            },
                          ),
                          GetX<ExamController>(
                            builder: (_) {
                              if (_.showAnswerMap[obj.id] == true) {
                                if (_.answerMap[obj.id] == null) {
                                  return const CircularProgressIndicator(
                                    color: ColorManager.primary,
                                  );
                                } else if (_.answerMap[obj.id]!.isEmpty) {
                                  return FontManager.kText(
                                    Typo.label,
                                    "현재 준비 중입니다",
                                  );
                                } else {
                                  return ExpandablePageView.builder(
                                    itemCount: _.answerMap[obj.id]!.length,
                                    itemBuilder: (context, index) {
                                      return Hero(
                                        tag: _.answerMap[obj.id]![index].id,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ColorManager.gray1,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          padding: const EdgeInsets.all(16),
                                          width: context.width,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              FontManager.kText(
                                                Typo.p2,
                                                _.answerMap[obj.id]![index]
                                                    .content,
                                              ),
                                              if (_.answerMap[obj.id]![index]
                                                      .referenceUrls !=
                                                  null)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 16, bottom: 8),
                                                  child: FontManager.text(
                                                    Typo.h4,
                                                    "참고 자료",
                                                  ),
                                                ),
                                              if (_.answerMap[obj.id]![index]
                                                      .referenceUrls !=
                                                  null)
                                                SizedBox(
                                                  height: 100,
                                                  child: ListView.separated(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    shrinkWrap: true,
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            const SizedBox(
                                                                width: 12),
                                                    itemBuilder:
                                                        (context, idx) {
                                                      return SizedBox(
                                                        width:
                                                            context.width * 0.4,
                                                        child: AnyLinkPreview
                                                            .builder(
                                                          link: _
                                                                  .answerMap[
                                                                      obj.id]![
                                                                      index]
                                                                  .referenceUrls![
                                                              idx],
                                                          itemBuilder: (context,
                                                              metaData,
                                                              imageProvider) {
                                                            SupabaseService
                                                                .logger
                                                                .i(imageProvider);
                                                            return GestureDetector(
                                                              onTap: () {
                                                                UrlLauncher.launchURL(_
                                                                    .answerMap[
                                                                        obj.id]![
                                                                        index]
                                                                    .referenceUrls![idx]);
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      ColorManager
                                                                          .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                ),
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(16),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    if (metaData
                                                                            .title !=
                                                                        null)
                                                                      FontManager
                                                                          .text(
                                                                        Typo.p2,
                                                                        metaData
                                                                            .title!,
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                    FontManager
                                                                        .kText(
                                                                      Typo.p,
                                                                      metaData
                                                                          .url!
                                                                          .split(
                                                                              '%')[0],
                                                                      color: ColorManager
                                                                          .blue,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                    itemCount: _
                                                        .answerMap[obj.id]![
                                                            index]
                                                        .referenceUrls!
                                                        .length,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                  ),
                                                ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 16),
                                                child: TextField(
                                                  controller: ChatController
                                                      .to.inputController,
                                                  onTapOutside: (event) {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                  },
                                                  onSubmitted: (value) {
                                                    onSendChatPressed(
                                                        _.answerMap[obj.id]![
                                                            index]);
                                                  },
                                                  onTap: () {
                                                    onSendChatPressed(
                                                        _.answerMap[obj.id]![
                                                            index]);
                                                  },
                                                  decoration: InputDecoration(
                                                    suffixIcon: IconButton(
                                                      onPressed: () {
                                                        onSendChatPressed(_
                                                                .answerMap[
                                                            obj.id]![index]);
                                                      },
                                                      icon: const Icon(
                                                        PhosphorIcons
                                                            .paperPlaneTiltFill,
                                                        color: ColorManager
                                                            .secondary,
                                                      ),
                                                    ),
                                                    hintText: "무엇이든 물어보세요",
                                                    filled: true,
                                                    fillColor:
                                                        ColorManager.white,
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  }
                  return const Placeholder();
                },
              );
            }
          },
        ),
      ),
    );
  }
}
