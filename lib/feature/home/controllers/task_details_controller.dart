import 'dart:io';
import 'package:get/get.dart';

class TaskDetailsController extends GetxController {
  /// Attachments
  RxList<File> attachments = <File>[].obs;

  RxList<Map<String, dynamic>> subTasks = <Map<String, dynamic>>[].obs;

  RxBool activeNotification=false.obs;

  void addAttachment(File file) {
    attachments.add(file);
  }

  void removeAttachment(int index) {
    attachments.removeAt(index);
  }


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
}
