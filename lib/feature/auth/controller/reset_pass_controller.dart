import 'package:doneboxai/core/conts/endpoints.dart';
import 'package:doneboxai/core/networks/api_client.dart';
import 'package:doneboxai/feature/auth/controller/forgot_pass_controller.dart';
import 'package:doneboxai/feature/auth/controller/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/global_controllers.dart';

class ResetPasswordController extends GetxController {
  RxBool isPasswordHidden = true.obs;
  RxBool isConfirmPasswordHidden = true.obs;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final globalController = Get.find<GlobalController>();

  // final _apiClient = ApiClient(baseUrl: Endpoints.baseUrl);
  final forgetPasswordController = Get.find<ForgotPasswordController>();
  final otpController = Get.find<OtpController>();
  final formKey = GlobalKey<FormState>();

  void togglePass() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPass() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Future<dynamic> resetPassword() async {
    try {
      final body = {
        "email": otpController.forgotPasswordController.emailController.text,
        "otp_code": otpController.otp.value,
        "password": passwordController.text,
        "retype_password": confirmPasswordController.text,
      };
      final response = await globalController.apiClient.post(
        Endpoints.resetPassword,
        body: body,
      );

      return response;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
