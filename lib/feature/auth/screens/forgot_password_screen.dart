import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/core/utils/helper_functions.dart';
import 'package:doneboxai/feature/auth/controller/forgot_pass_controller.dart';
import 'package:doneboxai/feature/widgets/app_icon.dart';
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

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
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
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppIcon(),
                  SizedBox(height: height * 0.02),
                  Text(
                    "Forgot password",
                    style: TextStyle(
                      fontSize: isPortrait ? width * 0.07 : width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  /// Subtitle
                  Text(
                    "Please enter your email address to reset password.",
                    style: TextStyle(
                      fontSize: isPortrait ? width * 0.04 : width * 0.035,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: height * 0.08),

                  /// Label
                  Text(
                    "Your Email",
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),

                  /// Input
                  CustomTextField(
                    hintText: "Enter Email",
                    icon: Icons.email_outlined,
                    controller: controller.emailController,
                  ),
                  SizedBox(height: height * 0.03),

                  /// Button
                  CustomButton(
                    width: double.infinity,
                    text: "Send OTP",
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
      ),
    );
  }
}
