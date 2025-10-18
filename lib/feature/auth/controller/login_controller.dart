import 'dart:convert';

import 'package:doneboxai/core/conts/app_consts.dart';
import 'package:doneboxai/core/conts/endpoints.dart';
import 'package:doneboxai/core/networks/api_client.dart';
import 'package:doneboxai/core/storage/app_storage.dart';
import 'package:doneboxai/feature/controllers/global_controllers.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isPasswordHidden = true.obs;
  RxBool isLoading = false.obs;
  final globalController = Get.find<GlobalController>();
  final _apiClient = ApiClient(baseUrl: Endpoints.baseUrl);

  void togglePass() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }
    try {
      isLoading.value = true;
      final body = {
        "email": emailController.text,
        "password": passwordController.text,
      };
      final response = await _apiClient.post(Endpoints.login, body: body);
      if (response['status_code'] == 200) {
        AppStorage.write(AppConstants.accessToken, response['data']['access']);
        AppStorage.write(
          AppConstants.refreshToken,
          response['data']['refresh'],
        );
        Get.offAllNamed(RoutesName.mainScreen);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
