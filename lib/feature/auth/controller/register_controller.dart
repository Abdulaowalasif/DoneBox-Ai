import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  RxBool isPasswordHidden = true.obs;
  RxBool isAgreed = false.obs;

  void togglePass() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleCheckBox() {
    isAgreed.value = !isAgreed.value;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
