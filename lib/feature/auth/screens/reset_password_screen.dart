import 'package:doneboxai/feature/auth/controller/reset_pass_controller.dart';
import 'package:doneboxai/feature/auth/screens/login_screen.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_fields.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final ResetPasswordController controller =
    Get.find<ResetPasswordController>();

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
            padding: EdgeInsets.all(screenSize.width * 0.05), // Dynamic padding based on screen size
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Password",
                    style: TextStyle(
                      fontSize: isPortrait ? 16 : 18, // Adjust font size based on orientation
                      fontWeight: FontWeight.w500,
                    ),
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
                        onPressed: controller.togglePass,
                      ),
                    ),
                  ),
                  const Text(
                    "Confirm Password",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),

                  Obx(
                        () => CustomTextField(
                      hintText: "Enter Password",
                      icon: Icons.lock_outline,
                      obscureText: controller.isConfirmPasswordHidden.value,
                      controller: controller.confirmPasswordController,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isConfirmPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: controller.toggleConfirmPass,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  CustomButton(
                    text: "Reset Password",
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.all(screenSize.width * 0.05), // Dynamic padding
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFE3F1FF),
                                  ),
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 72,
                                    height: 72,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF005FA8),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 30),

                                const Text(
                                  'Password Changed!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                const Text(
                                  'Return to the login page to enter your\naccount with your new password.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),

                                const SizedBox(height: 20),
                                CustomButton(
                                  text: 'Back to Sign In',
                                  onPressed: () {
                                    Get.offAllNamed(RoutesName.login);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
