import 'package:doneboxai/feature/tasks/controllers/create_new_task_controller.dart';
import 'package:get/get.dart';

class CreateNewTaskBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreateNewTaskController(),fenix: true);
  }
}