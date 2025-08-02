import 'package:doneboxai/core/utils/helper_functions.dart';
import 'package:doneboxai/feature/auth/controller/login_controller.dart';
import 'package:doneboxai/feature/auth/screens/forgot_password_screen.dart';
import 'package:doneboxai/feature/auth/screens/register_screen.dart';
import 'package:doneboxai/feature/home/screens/onboarding_screen.dart';
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 153),
                  Text(
                    "Sign In to\nyour account",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Welcome Back! Please Enter Your Details.",
                    style: TextStyle(fontSize: 14, color: Colors.black),
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
                      child: Text("Forgot Password?"),
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
                        child: const Text("Sign Up"),
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
