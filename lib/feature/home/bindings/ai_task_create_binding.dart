import 'package:doneboxai/feature/home/controllers/ai_task_create_controller.dart';
import 'package:get/get.dart';

class AiTaskCreateBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AiTaskCreateController(),fenix: true);
  }
}