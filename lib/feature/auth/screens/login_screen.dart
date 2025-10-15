import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/core/conts/my_text_style.dart';
import 'package:doneboxai/core/utils/helper_functions.dart';
import 'package:doneboxai/feature/auth/controller/login_controller.dart';
import 'package:doneboxai/feature/widgets/app_icon.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_fields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.height > screenSize.width;

    // dynamic scaling factors
    final width = screenSize.width;
    final height = screenSize.height;
    final padding = width * 0.05;
    final titleFontSize = isPortrait ? width * 0.07 : width * 0.05;
    final subtitleFontSize = width * 0.035;
    final labelFontSize = width * 0.04;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConst.topBg),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(padding),
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.08),
                  const AppIcon(),
                  SizedBox(height: height * 0.02),

                  // Title
                  Text(
                    "Sign In to your account",
                    style: MyTextStyle.w6s30(context),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                    "Welcome Back! Please Enter Your Details.",
                    style: MyTextStyle.w4s16(context),
                  ),

                  SizedBox(height: height * 0.04),

                  // Email label
                  Text("Your Email", style: MyTextStyle.w4s18(context)),
                  SizedBox(height: height * 0.01),

                  CustomTextField(
                    hintText: "Enter Email",
                    icon: Icons.email_outlined,
                    controller: controller.emailController,
                  ),

                  SizedBox(height: height * 0.025),

                  // Password label
                  Text("Password", style: MyTextStyle.w4s18(context)),
                  SizedBox(height: height * 0.01),

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
                          size: width * 0.055,
                        ),
                        onPressed: controller.togglePass,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.01),

                  // Forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Get.toNamed(RoutesName.forgotPass),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue,
                        textStyle: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      child: Text(
                        "Forgot Password?",
                        style: MyTextStyle.w4s16(
                          context,
                        ).copyWith(color: AppColors.buttonColor),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  // Sign in button
                  Obx(
                    () => CustomButton(
                      width: double.infinity,
                      onPressed: () => controller.login(),
                      text: 'Sign In',
                      isLoading: controller.isLoading.value,
                    ),
                  ),

                  SizedBox(height: height * 0.025),

                  // Sign up link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t Have An Account?",
                        style: MyTextStyle.w4s16(context),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(RoutesName.register),
                        child: Text(
                          "Sign Up",
                          style: MyTextStyle.w4s16(
                            context,
                          ).copyWith(color: AppColors.buttonColor),
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
