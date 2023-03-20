import 'package:bar_gpt/constants/constants.dart';
import 'package:bar_gpt/helpers/secret.dart';
import 'package:dart_openai/openai.dart';

const String chatGptModel = "gpt-3.5-turbo";

class OpenAIService {
  static Future<void> init() async {
    OpenAI.apiKey = await SecretLoader(secretPath: secretsPath)
        .load()
        .then((secret) => secret.openAIApiKey);
  }

  static Future<OpenAIChatCompletionModel> getChatCompletion(
      List<OpenAIChatCompletionChoiceMessageModel>
          chatCompletionMessageList) async {
    return await OpenAI.instance.chat.create(
      model: chatGptModel,
      messages: chatCompletionMessageList,
    );
  }

  static Stream<OpenAIStreamChatCompletionModel> getChatCompletionStream(
      List<OpenAIChatCompletionChoiceMessageModel> chatCompletionMessageList) {
    return OpenAI.instance.chat.createStream(
      temperature: 0.3,
      model: chatGptModel,
      messages: chatCompletionMessageList,
    );
  }
}
