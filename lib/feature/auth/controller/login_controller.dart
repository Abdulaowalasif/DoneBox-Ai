import 'dart:convert';

import 'package:doneboxai/feature/controllers/global_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isPasswordHidden = true.obs;
  final globalController = Get.find<GlobalController>();

  void togglePass() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {

  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
