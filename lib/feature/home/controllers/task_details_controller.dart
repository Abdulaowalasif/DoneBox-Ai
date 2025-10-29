import 'dart:io';
import 'package:doneboxai/core/conts/endpoints.dart';
import 'package:doneboxai/feature/controllers/global_controllers.dart';
import 'package:get/get.dart';

class TaskDetailsController extends GetxController {
  /// Attachments
  RxList<File> attachments = <File>[].obs;

  RxList<dynamic> subTasks = [].obs;

  RxBool activeNotification = false.obs;
  final GlobalController globalController = Get.find();
  var details = {}.obs;
  var isLoading = false.obs;

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

  void fetchTaskDetails(taskId) async {
    try {
      isLoading.value = true;
      final headers = {
        'Authorization': 'Bearer ${globalController.accessToken}',
      };

      final response = await globalController.apiClient.get(
        "${Endpoints.tasks}${taskId}",
        headers: headers,
      );
      if (response['status_code'] == 200) {
        isLoading.value = false;
        details.value = response['data'];
        subTasks.value = details['sub_tasks'];
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
