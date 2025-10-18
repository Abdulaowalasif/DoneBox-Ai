import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/conts/endpoints.dart';
import '../../../core/networks/api_client.dart';
import '../../controllers/global_controllers.dart';

class QuickActionController extends GetxController {
  String title = "";

  final globalController = Get.find<GlobalController>();
  final _apiClient = ApiClient(baseUrl: Endpoints.aiBaseUrl);

  final TextEditingController textController = TextEditingController();
  var responseController = "".obs;

  final isLoading = false.obs;

  Future<void> getSummery() async {
    if (textController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please enter text before summarizing");
      return;
    }

    try {
      isLoading.value = true;

      final body = {"text": textController.text};
      final response = await _apiClient.post(Endpoints.summerize, body: body);

      if (response['data'] != null) {
        responseController.value = response['data'];
      } else {
        responseController.value = "No summary available.";
      }

      print("Response: $response");
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print("Error in getSummery: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getReply() async {
    if (textController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please enter text before summarizing");
      return;
    }

    try {
      isLoading.value = true;

      final body = {"text": textController.text};
      final response = await _apiClient.post(Endpoints.reply, body: body);

      if (response['data'] != null) {
        responseController.value = response['data'];
      } else {
        responseController.value = "No summary available.";
      }

      print("Response: $response");
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print("Error in getSummery: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getExplain() async {
    if (textController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please enter text before summarizing");
      return;
    }

    try {
      isLoading.value = true;

      final body = {"text": textController.text};
      final response = await _apiClient.post(Endpoints.explain, body: body);

      if (response['data'] != null) {
        responseController.value = response['data'];
      } else {
        responseController.value = "No summary available.";
      }

      print("Response: $response");
    } catch (e) {
      Get.snackbar("Error", e.toString());
      print("Error in getSummery: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
