import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/my_text_style.dart';
import 'package:doneboxai/feature/auth/controller/reset_pass_controller.dart';
import 'package:doneboxai/feature/widgets/app_icon.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conts/image_icon_const.dart';
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
    final width = screenSize.width;
    final height = screenSize.height;
    final isPortrait = height > width;

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          Get.back();
          return false;
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConst.topBg),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(width * 0.05), // Dynamic padding
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppIcon(),
                  SizedBox(height: height * 0.02),

                  /// Title
                  Text(
                    "New Password",
                    style: MyTextStyle.w4s18(context),
                  ),
                  SizedBox(height: height * 0.015),

                  /// New Password Field
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

                  SizedBox(height: height * 0.03),

                  /// Confirm Password
                  Text(
                    "Confirm Password",
                    style: MyTextStyle.w4s18(context)
                  ),
                  SizedBox(height: height * 0.015),

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

                  SizedBox(height: height * 0.04),

                  /// Reset Button
                  CustomButton(
                    width: double.infinity,
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
                          return Padding(
                            padding: EdgeInsets.all(width * 0.06),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                /// Success Icon
                                Container(
                                  width: width * 0.3,
                                  height: width * 0.3,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.secondaryColor,
                                  ),
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: width * 0.18,
                                    height: width * 0.18,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.buttonColor,
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: width * 0.09,
                                    ),
                                  ),
                                ),

                                SizedBox(height: height * 0.03),

                                /// Success Title
                                Text(
                                  'Password Changed!',
                                  style: MyTextStyle.w5s20(context)
                                ),

                                SizedBox(height: height * 0.015),

                                /// Success Message
                                Text(
                                  'Return to the login page to enter your\naccount with your new password.',
                                  textAlign: TextAlign.center,
                                  style: MyTextStyle.w4s18(context),
                                ),

                                SizedBox(height: height * 0.03),

                                /// Back Button
                                CustomButton(
                                  width: double.infinity,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
