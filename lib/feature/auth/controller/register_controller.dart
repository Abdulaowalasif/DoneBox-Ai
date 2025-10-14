import 'dart:convert';

import 'package:doneboxai/core/conts/endpointd.dart';
import 'package:doneboxai/core/networks/api_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/global_controllers.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  RxBool isPasswordHidden = true.obs;
  RxBool isConfirmPasswordHidden = true.obs;
  RxBool isAgreed = false.obs;

  final apiClient = ApiClient(baseUrl: Endpoints.baseUrl);
  final globalController = Get.find<GlobalController>();

  void togglePass() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
  void toggleConfirmPass() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  void toggleCheckBox() {
    isAgreed.value = !isAgreed.value;
  }

  Future<void> register() async {
    final body = {
      "first_name": firstNameController.text.trim(),
      "last_name": lastNameController.text.trim(),
      "email": emailController.text.trim(),
      "phone": phoneController.text.trim(),
      "password": passwordController.text.trim(),
      "retype_password": confirmPasswordController.text.trim(),
    };
   try{}catch(e){
     Get.snackbar("Something went wrong", "");
   }



  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
