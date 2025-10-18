import 'dart:convert';

import 'package:doneboxai/core/conts/endpoints.dart';
import 'package:doneboxai/core/networks/api_client.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/global_controllers.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  final globalController = Get.find<GlobalController>();
  final _apiClient = ApiClient(baseUrl: Endpoints.baseUrl);
  RxBool isLoading = false.obs;

  Future<void> forgotPass() async {
    if (emailController.text.isEmpty) {
      Get.snackbar("Error", "Please enter email");
      return;
    }
    isLoading.value = true;
    try {
      final body = {"email": emailController.text, "purpose": "reset_password"};
      final response = await _apiClient.post(Endpoints.sendOtp, body: body);

      print(response);

      if (response["status_code"] == 200) {
        Get.snackbar("Success", response["message"]);
        Get.toNamed(RoutesName.verifyOtp);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
