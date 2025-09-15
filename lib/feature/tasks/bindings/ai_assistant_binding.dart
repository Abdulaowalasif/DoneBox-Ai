import 'package:doneboxai/feature/tasks/controllers/ai_assistant_controller.dart';
import 'package:get/get.dart';

class AiAssistantBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(fenix: true,() => AiAssistantController(),);
  }
}