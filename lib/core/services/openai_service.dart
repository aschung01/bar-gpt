import 'package:bar_gpt/constants/constants.dart';
import 'package:bar_gpt/core/services/api_service.dart';
import 'package:bar_gpt/core/services/supabase_service.dart';
import 'package:bar_gpt/helpers/secret.dart';
import 'package:dart_openai/openai.dart';
import 'package:get/get.dart';

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

  static Stream<dynamic> getChatCompletionStream(
      List<OpenAIChatCompletionChoiceMessageModel> chatCompletionMessageList) {
    if (GetPlatform.isWeb) {
      return (createStream(
        temperature: 0.3,
        model: chatGptModel,
        messages: chatCompletionMessageList,
      ))!;
    } else {
    return OpenAI.instance.chat.createStream(
      temperature: 0.3,
      model: chatGptModel,
      messages: chatCompletionMessageList,
    );
    }
  }

  static Stream<dynamic>? createStream({
    required String model,
    required List<OpenAIChatCompletionChoiceMessageModel> messages,
    double? temperature,
    double? topP,
    int? n,
    stop,
    int? maxTokens,
    double? presencePenalty,
    double? frequencyPenalty,
    Map<String, dynamic>? logitBias,
    String? user,
  }) {
    Map<String, dynamic> body = {
      "model": model,
      "messages": messages.map((message) => message.toMap()).toList(),
      "stream": true,
      if (temperature != null) "temperature": temperature,
      if (topP != null) "top_p": topP,
      if (n != null) "n": n,
      if (stop != null) "stop": stop,
      if (maxTokens != null) "max_tokens": maxTokens,
      if (presencePenalty != null) "presence_penalty": presencePenalty,
      if (frequencyPenalty != null) "frequency_penalty": frequencyPenalty,
      if (logitBias != null) "logit_bias": logitBias,
      if (user != null) "user": user,
    };
    try {
      return ApiService.postStream("/chat/completions", body,
          (Map<String, dynamic> response) {
        return response;
      }, openAI: true);
    } catch (e) {
      SupabaseService.logger.e(e, e);
      return null;
    }
  }
}
