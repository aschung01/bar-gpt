import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class Secret {
  final String supabaseUrl;
  final String supabaseAnonKey;
  final String openAIApiKey;
  Secret({
    this.supabaseUrl = "",
    this.supabaseAnonKey = "",
    this.openAIApiKey = "",
  });
  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return Secret(
        supabaseUrl: jsonMap["SUPABASE_URL"],
        supabaseAnonKey: jsonMap["SUPABASE_ANON_KEY"],
        openAIApiKey: jsonMap["OPENAI_API_KEY"]);
  }
}

class SecretLoader {
  final String secretPath;
  SecretLoader({required this.secretPath});
  Future<Secret> load() {
    return rootBundle.loadStructuredData<Secret>(
      secretPath,
      (jsonStr) async {
        final secret = Secret.fromJson(json.decode(jsonStr));
        return secret;
      },
    );
  }
}
