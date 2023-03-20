import 'package:bar_gpt/ui/pages/answer_page.dart';
import 'package:bar_gpt/ui/pages/chat_page.dart';
import 'package:bar_gpt/ui/pages/main_page.dart';
import 'package:bar_gpt/ui/pages/splash_page.dart';
import 'package:bar_gpt/ui/views/exam_view.dart';
import 'package:get/route_manager.dart';

abstract class Routes {
  static const String main = "/";
  static const String exam = "/exam";
  static const String chat = "/chat";
}

class AppRoutes {
  AppRoutes._();
  static final routes = [
    GetPage(name: Routes.main, page: () => const MainPage()),
    GetPage(name: Routes.exam, page: () => const ExamView()),
    GetPage(name: Routes.chat, page: () => const ChatPage()),
  ];
}
