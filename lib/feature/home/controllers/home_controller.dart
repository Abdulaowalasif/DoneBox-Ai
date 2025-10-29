import 'package:doneboxai/core/conts/endpoints.dart';
import 'package:doneboxai/core/networks/api_client.dart';
import 'package:doneboxai/feature/controllers/global_controllers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final GlobalController globalController = Get.find();
  final todayProgress = {}.obs;
  final tasks = [].obs;
  final isLoading = true.obs;

  void fetchTodayProgress() async {
    try {
      isLoading.value = true;
      final headers = {
        "authorization": "Bearer ${globalController.accessToken}",
      };

      final response = await globalController.apiClient.get(
        Endpoints.todaySummery,
        headers: headers,
      );
      if (response['status_code'] == 200) {
        todayProgress.value = response['data'];
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void fetchTasks() async {
    try {
      final headers = {
        "authorization": "Bearer ${globalController.accessToken}",
      };

      final params = {"tl_task_only": "true"};

      final response = await globalController.apiClient.get(
        Endpoints.tasks,
        headers: headers,
        query: params,
      );

      if (response['status_code'] == 200) {
        tasks.value = response['data'];
      }
      print(tasks);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchTodayProgress();
    fetchTasks();
  }
}
