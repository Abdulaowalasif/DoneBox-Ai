import 'dart:convert';

import 'package:doneboxai/core/conts/endpoints.dart';
import 'package:doneboxai/core/networks/api_client.dart';
import 'package:doneboxai/feature/auth/controller/register_controller.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/global_controllers.dart';
import 'forgot_pass_controller.dart';

class OtpController extends GetxController {
  final globalController = Get.find<GlobalController>();
  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  final apiClient = ApiClient(baseUrl: Endpoints.baseUrl);
  final RegisterController signupController = Get.find();
  final ForgotPasswordController forgotPasswordController = Get.find();

  var otp = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onClose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.onClose();
  }

  void onOtpEntered(String value, int index) {
    if (value.length == 1 && index < 5) {
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    otp.value = controllers.map((e) => e.text).join();
  }

  void verifyOtp(BuildContext context) {
    if (otp.value.length == 6) {
      verifyCode();
    } else {
      Get.snackbar("Invalid Input", 'Enter all the digits');
    }
  }

  Future<void> verifyCode() async {
    final body = {
      "email": signupController.emailController.text.trim(),
      "purpose": "create_account",
      "otp_code": otp.value,
    };
    try {
      isLoading.value = true;
      final response = await apiClient.post(Endpoints.verifyOtp, body: body);
      if (response["status_code"] == 200) {
        isLoading.value = false;
        Get.toNamed(RoutesName.login);
      }
    } catch (e) {
      Get.snackbar("$e", "");
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyResetCode() async {
    final body = {
      "email": forgotPasswordController.emailController.text.trim(),
      "purpose": "reset_password",
      "otp_code": otp.value,
    };
    try {
      isLoading.value = true;
      final response = await apiClient.post(Endpoints.verifyOtp, body: body);
      if (response["status_code"] == 200) {
        isLoading.value = false;
        Get.toNamed(RoutesName.resetPass);
      }
    } catch (e) {
      Get.snackbar("$e", "");
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
