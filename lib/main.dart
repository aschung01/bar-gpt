import 'package:bar_gpt/constants/app_routes.dart';
import 'package:bar_gpt/core/controllers/chat_controller.dart';
import 'package:bar_gpt/core/controllers/exam_controller.dart';
import 'package:bar_gpt/core/controllers/main_controller.dart';
import 'package:bar_gpt/core/services/openai_service.dart';
import 'package:bar_gpt/core/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseService.init();
  await OpenAIService.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put<MainController>(MainController());
  Get.put<ExamController>(ExamController());
  Get.put<ChatController>(ChatController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.main,
      getPages: AppRoutes.routes,
      builder: EasyLoading.init(),
    );
  }
}
