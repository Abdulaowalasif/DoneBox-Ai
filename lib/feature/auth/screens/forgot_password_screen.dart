import 'package:doneboxai/core/utils/helper_functions.dart';
import 'package:doneboxai/feature/auth/controller/forgot_pass_controller.dart';
import 'package:doneboxai/feature/auth/screens/verify_code_screen.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_fields.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller =
        Get.find<ForgotPasswordController>();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Forgot password",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "Please enter your email address to reset password.",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              const SizedBox(height: 100),
              CustomTextField(
                hintText: "Enter Email",
                icon: Icons.email_outlined,
                controller: controller.emailController,
              ),
              const SizedBox(height: 20),

              CustomButton(
                text: "Send Otp",
                onPressed: () {
                  if (HelperFunctions.isValidEmail(
                    controller.emailController.text,
                  )) {
                    Get.toNamed(RoutesName.verifyOtp);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
