import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/global_controllers.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  final globalController = Get.find<GlobalController>();

  Future<void> forgotPass() async {}

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
