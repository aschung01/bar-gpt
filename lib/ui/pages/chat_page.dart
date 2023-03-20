import 'dart:ui';

import 'package:any_link_preview/any_link_preview.dart';
import 'package:bar_gpt/core/controllers/chat_controller.dart';
import 'package:bar_gpt/core/controllers/exam_controller.dart';
import 'package:bar_gpt/helpers/color_manager.dart';
import 'package:bar_gpt/helpers/font_manager.dart';
import 'package:bar_gpt/helpers/url_launcher.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  void onSendChat(String text) {
    controller.handleSendPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.gray1,
        foregroundColor: ColorManager.gray9,
      ),
      backgroundColor: ColorManager.gray1,
      body: SafeArea(
        child: GetBuilder<ChatController>(
          builder: (_) {
            return NestedScrollView(
              headerSliverBuilder: (context, open) {
                return [
                  SliverToBoxAdapter(
                    child: Hero(
                      tag: _.currentAnswer!.id,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FontManager.kText(
                              Typo.p2,
                              _.currentAnswer!.content,
                            ),
                            if (_.currentAnswer!.referenceUrls != null)
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 16, bottom: 8),
                                child: FontManager.text(
                                  Typo.h4,
                                  "참고 자료",
                                ),
                              ),
                            if (_.currentAnswer!.referenceUrls != null)
                              SizedBox(
                                height: 100,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 12),
                                  itemBuilder: (context, idx) {
                                    return SizedBox(
                                      width: context.width * 0.4,
                                      child: AnyLinkPreview.builder(
                                        link: _
                                            .currentAnswer!.referenceUrls![idx],
                                        itemBuilder:
                                            (context, metaData, imageProvider) {
                                          return GestureDetector(
                                            onTap: () {
                                              UrlLauncher.launchURL(_
                                                  .currentAnswer!
                                                  .referenceUrls![idx]);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: ColorManager.white,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (metaData.title != null)
                                                    FontManager.text(
                                                      Typo.p2,
                                                      metaData.title!,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  FontManager.kText(
                                                    Typo.p,
                                                    metaData.url!.split('%')[0],
                                                    color: ColorManager.blue,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  itemCount:
                                      _.currentAnswer!.referenceUrls!.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Container(
                decoration: BoxDecoration(
                  color: ColorManager.white,
                ),
                constraints: BoxConstraints(minHeight: context.height * 0.2),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 20,
                ),
                child: GetX<ChatController>(
                  builder: (_) {
                    return ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.only(
                        bottom: context.mediaQueryViewPadding.bottom + 100,
                      ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (_.messageList[index].role == Role.user) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: context.width * 0.7,
                                ),
                                child: Bubble(
                                  padding: const BubbleEdges.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  elevation: 0,
                                  nip: BubbleNip.rightTop,
                                  color: ColorManager.secondary,
                                  child: FontManager.text(
                                    Typo.p2,
                                    _.messageList[index].content,
                                    color: ColorManager.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (_.messageList[index].role ==
                            Role.assistant) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: context.width * 0.7,
                                ),
                                child: Bubble(
                                  elevation: 0,
                                  padding: const BubbleEdges.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  nip: BubbleNip.leftTop,
                                  color: ColorManager.gray1,
                                  child: GetX<ChatController>(builder: (_) {
                                    return FontManager.text(
                                      Typo.p2,
                                      (_.isChatCompletionLoading.value &&
                                              index == _.messageList.length - 1)
                                          ? _.chatCompletionMessage.value
                                          : _.messageList[index].content,
                                      color: ColorManager.gray9,
                                    );
                                  }),
                                ),
                              )
                            ],
                          );
                        }
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemCount: _.messageList.length,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(12),
        child: GetX<ChatController>(builder: (_) {
          return TextField(
            controller: ChatController.to.inputController,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            onSubmitted: onSendChat,
            decoration: InputDecoration(
              suffixIcon: _.isChatCompletionLoading.value
                  ? const Padding(
                      padding: EdgeInsets.all(8),
                      child: CircularProgressIndicator(
                        color: ColorManager.secondary,
                      ),
                    )
                  : IconButton(
                      onPressed: controller.handleSendPressed,
                      icon: const Icon(
                        PhosphorIcons.paperPlaneTiltFill,
                        color: ColorManager.secondary,
                      ),
                    ),
              hintText: "무엇이든 물어보세요",
              filled: true,
              fillColor: ColorManager.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }),
      ),
    );
    ;
  }
}
