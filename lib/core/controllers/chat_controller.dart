import 'dart:math';

import 'package:bar_gpt/core/models/answer.dart';
import 'package:bar_gpt/core/services/openai_service.dart';
import 'package:bar_gpt/core/services/supabase_service.dart';
import 'package:dart_openai/openai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Role { assistant, user }

class Message {
  final Role role;
  final String content;

  Message({
    required this.role,
    required this.content,
  });
}

class ChatController extends GetxController {
  static ChatController to = Get.find<ChatController>();

  late TextEditingController inputController;
  Answer? currentAnswer;
  RxBool isChatCompletionLoading = false.obs;
  Stream<OpenAIStreamChatCompletionModel>? chatCompletionStream;
  RxString chatCompletionMessage = "".obs;
  List<OpenAIChatCompletionChoiceMessageModel> chatCompletionMessageList = [
    OpenAIChatCompletionChoiceMessageModel(
      role: "system",
      content: "한국어로 대답하고, 한국 법을 참조해서 답변해줘",
    ),
  ];
  RxList<Message> messageList = <Message>[].obs;

  @override
  void onInit() {
    inputController = TextEditingController();
    super.onInit();
  }

  void initChat(Answer answer) {
    if (answer != currentAnswer) {
      currentAnswer = answer;
      messageList.clear();
      chatCompletionMessageList = [
        OpenAIChatCompletionChoiceMessageModel(
          role: "system",
          content: "한국어로 대답하고, 한국 법을 참조해서 답변해줘",
        ),
      ];
    }
    handleSendPressed();
  }

  void addMessage(String message) {
    messageList.add(Message(role: Role.user, content: message));
    if (chatCompletionMessageList.length == 1) {
      message = "[모범답안]\n${currentAnswer?.content}\n$message";
    }
    chatCompletionMessageList.add(
      OpenAIChatCompletionChoiceMessageModel(
        role: "user",
        content: message,
      ),
    );
  }

  void handleSendPressed() {
    if (inputController.text.isNotEmpty && !isChatCompletionLoading.value) {
      addMessage(inputController.text);
      inputController.clear();
      chatCompletionStream =
          OpenAIService.getChatCompletionStream(chatCompletionMessageList);
      if (!isChatCompletionLoading.value) {
        isChatCompletionLoading.value = true;
        messageList.add(
          Message(role: Role.assistant, content: ""),
        );
      }

      chatCompletionStream!.listen(
        (event) {
          SupabaseService.logger.i(event);
          chatCompletionMessage.value +=
              event.choices.first.delta.content ?? "";
          update();
        },
        onDone: () {
          chatCompletionMessageList.add(
            OpenAIChatCompletionChoiceMessageModel(
              role: "assistant",
              content: chatCompletionMessage.value,
            ),
          );
          messageList.setAll(
            messageList.length - 1,
            [
              Message(
                role: Role.assistant,
                content: chatCompletionMessage.value,
              ),
            ],
          );
          chatCompletionMessage.value = "";
          isChatCompletionLoading.value = false;
        },
        onError: (error) {
          print(error);
          SupabaseService.logger.e(error);
        },
      );
    }
  }
}
