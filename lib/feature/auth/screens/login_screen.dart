import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/utils/helper_functions.dart';
import 'package:doneboxai/feature/auth/controller/login_controller.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_fields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find<LoginController>();
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.height > screenSize.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.05),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenSize.height * 0.1),

                  Text(
                    "Sign In to\nyour account",
                    style: TextStyle(
                      fontSize: isPortrait ? 24 : 28,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Welcome Back! Please Enter Your Details.",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 40),

                  const Text(
                    "Your Email",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),

                  CustomTextField(
                    hintText: "Enter Email",
                    icon: Icons.email_outlined,
                    controller: controller.emailController,
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),

                  Obx(
                    () => CustomTextField(
                      hintText: "Enter Password",
                      icon: Icons.lock_outline,
                      obscureText: controller.isPasswordHidden.value,
                      controller: controller.passwordController,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () => controller.togglePass(),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(RoutesName.forgotPass);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue,
                        textStyle: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: AppColors.buttonColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  CustomButton(
                    onPressed: () {
                      if (HelperFunctions.isValidEmail(
                            controller.emailController.text,
                          ) &&
                          HelperFunctions.isValidPassword(
                            controller.passwordController.text,
                          )) {
                        Get.offAllNamed(RoutesName.onboarding);
                      } else {
                        String message = '';

                        if (!HelperFunctions.isValidEmail(
                          controller.emailController.text,
                        )) {
                          message += 'Please enter a valid email.\n';
                        }

                        String passwordError = HelperFunctions.validatePassword(
                          controller.passwordController.text,
                        );
                        if (passwordError.isNotEmpty) {
                          message += passwordError;
                        }

                        if (message.isNotEmpty) {
                          Get.snackbar('Invalid Input', message.trim());
                        }
                      }
                    },
                    text: 'Sign In',
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t Have An Account?"),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(RoutesName.register);
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: AppColors.buttonColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
