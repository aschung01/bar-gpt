import 'package:bar_gpt/core/models/exam.dart';
import 'package:bar_gpt/core/services/supabase_service.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController to = Get.find<MainController>();
  
  RxList<Exam> examList = <Exam>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchExamList();
  }

  Future<void> fetchExamList() async {
    List<Exam> response = await SupabaseService.getExamList();
    examList.assignAll(response);
  }
}
