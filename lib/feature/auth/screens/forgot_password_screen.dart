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

    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.height > screenSize.width;

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          Get.back();
          return false;
        },
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Forgot password",
                  style: TextStyle(
                    fontSize: isPortrait ? 24 : 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Please enter your email address to reset password.",
                  style: TextStyle(fontSize: isPortrait ? 14 : 16),
                ),
                SizedBox(height: screenSize.height * 0.1),

                const Text(
                  "Your Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),

                CustomTextField(
                  hintText: "Enter Email",
                  icon: Icons.email_outlined,
                  controller: controller.emailController,
                ),
                const SizedBox(height: 20),

                CustomButton(
                  width: double.infinity,
                  text: "Send Otp",
                  onPressed: () {
                    if (HelperFunctions.isValidEmail(
                      controller.emailController.text,
                    )) {
                      Get.toNamed(RoutesName.verifyOtp);
                    } else {
                      Get.snackbar('Invalid Input', 'Enter a valid email');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
