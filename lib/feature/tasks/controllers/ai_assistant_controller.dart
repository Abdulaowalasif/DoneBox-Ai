import 'dart:convert';

import 'package:doneboxai/core/conts/endpoints.dart';
import 'package:doneboxai/core/networks/api_client.dart';
import 'package:doneboxai/core/utils/helper_functions.dart';
import 'package:doneboxai/feature/controllers/global_controllers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AiAssistantController extends GetxController {
  RxBool remindMe = false.obs;
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs; // ✅ Store error message here
  final GlobalController controller = Get.find();
  final messageController = TextEditingController();
  var message = "Ask me anything".obs;


  RxMap<String, dynamic> aiAssistantResponse = <String, dynamic>{
    "data": {
      'title': "Meeting at 5 pm",
      'description': "Meeting at 5 pm",
      'category': "personal",
      'datetime_utc': "Meeting at 5 pm",
    },
  }.obs;

  Future<void> getAiAssistant() async {
    if (messageController.text.isNotEmpty) {
      message.value = messageController.text.trim();
      try {
        isLoading.value = true;
        errorMessage.value = '';

        final body = {
          "prompt": messageController.text.trim(),
          "timezone_offset": HelperFunctions.currentTimeZone(),
        };

        aiAssistantResponse.value = await controller.aiApiClient.post(
          Endpoints.reminder,
          body: body,
        );
        print(aiAssistantResponse);
      } catch (e) {
        if (e is HttpException) {
          try {
            final decoded = jsonDecode(e.body.toString());
            errorMessage.value =
                decoded['detail']?.toString() ?? e.body.toString();
          } catch (_) {
            errorMessage.value = e.body.toString();
          }
        } else {
          errorMessage.value = e.toString();
        }
      } finally {
        isLoading.value = false;
      }
    } else {
      errorMessage.value = "Please enter a message";
      Get.snackbar("Error", errorMessage.value);
    }
  }
}
