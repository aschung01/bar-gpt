import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:bar_gpt/constants/constants.dart';
import 'package:bar_gpt/core/controllers/chat_controller.dart';
import 'package:bar_gpt/core/services/supabase_service.dart';
import 'package:bar_gpt/main.dart';
import 'package:dart_openai/openai.dart';
import 'package:dio/dio.dart';
import 'package:bar_gpt/helpers/secret.dart';

Dio getOpenAIDio() {
  var dioOptions = BaseOptions(
    baseUrl: openAIUrl,
  );
  Dio dio = Dio(dioOptions);
  dio.interceptors.add(
    DioAuthInterceptor(),
  );

  return dio;
}

abstract class ApiService {
  static Dio dio = Dio();
  static Dio openAIDio = getOpenAIDio();

  static Future<dynamic> get(String path, Map<String, dynamic>? parameters,
      {bool openAI: false}) async {
    try {
      var response = openAI
          ? await openAIDio.get(
              path,
              queryParameters: parameters,
            )
          : await dio.get(
              path,
              queryParameters: parameters,
            );
      if (response.statusCode == 200) {
        logger.d(response);
        return response;
      } else if (response.data == null) {
        print(response.statusCode);
      }
    } on DioError catch (e) {
      logger.w(e, e);
    }
  }

  static Future<dynamic> post(String path, dynamic data,
      {bool openAI: false}) async {
    try {
      var response = openAI
          ? await openAIDio.post(
              path,
              data: data,
            )
          : await dio.post(
              path,
              data: data,
            );
      logger.d(response);
      return response;
    } on DioError catch (e) {
      logger.w(e, e);
    }
  }

  static Stream<dynamic>? postStream(
      String path, dynamic data, Function(Map<String, dynamic>) onSuccess,
      {bool openAI: false}) {
    try {
      StreamController<dynamic> controller = StreamController<dynamic>();
      openAIDio
          .post(
        path,
        data: data,
        options: Options(
          responseType: ResponseType.stream,
        ),
      )
          .then((response) {
        SupabaseService.logger.i("Starting to read stream response");
        response.data.stream.listen(
          (value) {
            final String data = utf8.decode(value);
            SupabaseService.logger.i(data);

            if (data.startsWith("data: ")) {
              if (data.contains("[DONE]")) {
                SupabaseService.logger.i("stream response is done");
                SupabaseService.logger
                    .i(ChatController.to.chatCompletionMessage);

                return;
              }

              final decoded = jsonDecode(data) as Map<String, dynamic>;
              controller.add(decoded);
              SupabaseService.logger.d(decoded);
              final completion = OpenAIStreamChatCompletionChoiceModel.fromMap(
                  decoded["choices"]);

              SupabaseService.logger.d(completion);
              inspect(completion);
              ChatController.to.chatCompletionMessage.value +=
                  completion.delta.content ?? "";
              ChatController.to.update();
              return;
            }
            final error = jsonDecode(data)['error'];
            if (error != null) {
              SupabaseService.logger.e(
                error["message"],
                response.statusCode,
              );
            }
          },
          onDone: () {
            ChatController.to.chatCompletionMessageList.add(
              OpenAIChatCompletionChoiceMessageModel(
                role: "assistant",
                content: ChatController.to.chatCompletionMessage.value,
              ),
            );
            ChatController.to.messageList.setAll(
              ChatController.to.messageList.length - 1,
              [
                Message(
                  role: Role.assistant,
                  content: ChatController.to.chatCompletionMessage.value,
                ),
              ],
            );
            ChatController.to.chatCompletionMessage.value = "";
            ChatController.to.isChatCompletionLoading.value = false;
          },
        );

        // yield* controller.stream;
        return controller.stream;
        // return response.data.stream;
      });
    } on DioError catch (e) {
      logger.e(e, e);
    }
  }
}

enum TokenErrorType { tokenNotFound, failedAccessTokenRegeneration }

class DioAuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] =
        'Bearer ${await SecretLoader(secretPath: secretsPath).load().then((secret) => secret.openAIApiKey)}';
    handler.next(options);
  }

  @override
  void onResponse(
    dynamic response,
    ResponseInterceptorHandler handler,
  ) =>
      handler.next(response);

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    logger.w(err, err);
  }
}
