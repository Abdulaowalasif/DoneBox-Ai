import 'dart:io';
import 'package:get/get.dart';

class CreateNewTaskController extends GetxController {
  RxString category = "Personal".obs;
  RxString priority = "Low".obs;
  RxString reminder = "Daily".obs;
  RxString dueDate = "2/9/2025".obs;
  RxString time = "7:00 AM".obs;
  RxBool notification = false.obs;

  /// Subtasks
  RxList<Map<String, dynamic>> subTasks = <Map<String, dynamic>>[].obs;

  /// Attachments
  RxList<File> attachments = <File>[].obs;

  void addSubTask(String title) {
    subTasks.add({"title": title, "done": false});
  }

  void toggleSubTask(int index, bool value) {
    subTasks[index]["done"] = value;
    subTasks.refresh();
  }

  void removeSubTask(int index) {
    subTasks.removeAt(index);
  }

  void addAttachment(File file) {
    attachments.add(file);
  }

  void removeAttachment(int index) {
    attachments.removeAt(index);
  }
}
