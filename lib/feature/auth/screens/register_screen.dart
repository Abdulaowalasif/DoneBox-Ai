import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/utils/helper_functions.dart';
import 'package:doneboxai/feature/auth/controller/register_controller.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conts/image_icon_const.dart';
import '../../../core/conts/my_text_style.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_fields.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find<RegisterController>();

    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.height > screenSize.width;

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
          padding: EdgeInsets.all(screenSize.width * 0.05),
          // Dynamic padding based on screen size
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign Up to\nyour account", style: MyTextStyle.w6s30()),
                  SizedBox(height: 8),
                  Text(
                    "Welcome Back! Please Enter Your Details.",
                    style: MyTextStyle.w4s16(),
                  ),
                  SizedBox(height: screenSize.height * 0.05),

                  // Dynamic height based on screen size
                  Text("Your Name", style: MyTextStyle.w4s18()),
                  SizedBox(height: 8),

                  CustomTextField(
                    hintText: "Enter Name",
                    icon: Icons.person_outline,
                    controller: controller.nameController,
                  ),
                  const SizedBox(height: 20),

                  Text("Your Email", style: MyTextStyle.w4s18()),
                  SizedBox(height: 8),

                  CustomTextField(
                    hintText: "Enter Email",
                    icon: Icons.email_outlined,
                    controller: controller.emailController,
                  ),
                  const SizedBox(height: 20),

                  Text("Phone", style: MyTextStyle.w4s18()),
                  SizedBox(height: 8),

                  CustomTextField(
                    hintText: "Enter Your Phone Number",
                    icon: Icons.phone,
                    controller: controller.phoneController,
                  ),
                  const SizedBox(height: 20),

                  Text("Password", style: MyTextStyle.w4s18()),
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

                  const SizedBox(height: 15),

                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          activeColor: AppColors.buttonColor,
                          value: controller.isAgreed.value,
                          onChanged: (value) => controller.toggleCheckBox(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'By creating an account, I accept the terms & condition  &\n',
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: MyTextStyle.w4s16().copyWith(
                                color: AppColors.primaryColor,
                                fontSize: 14,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(RoutesName.privacyPolicy);
                                },
                            ),
                            const TextSpan(text: '.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  Obx(
                    () => CustomButton(
                      width: double.infinity,
                      isEnabled: controller.isAgreed.value,
                      text: "Sign Up",
                      onPressed: () {
                        if (HelperFunctions.isValidEmail(
                              controller.emailController.text,
                            ) &&
                            HelperFunctions.isValidPassword(
                              controller.passwordController.text,
                            ) &&
                            HelperFunctions.isValidPhoneNumber(
                              controller.phoneController.text,
                            )) {
                          Get.offAllNamed(RoutesName.login);
                        } else {
                          String message = '';

                          if (!HelperFunctions.isValidEmail(
                            controller.emailController.text,
                          )) {
                            message += 'Please enter a valid email.\n';
                          }

                          if (!HelperFunctions.isValidPassword(
                            controller.passwordController.text,
                          )) {
                            message += 'Please enter a valid password.\n';
                          }

                          if (!HelperFunctions.isValidPhoneNumber(
                            controller.phoneController.text,
                          )) {
                            message += 'Please enter a valid phone number.\n';
                          }

                          if (message.isNotEmpty) {
                            Get.snackbar('Invalid Input', message.trim());
                          }
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have An Account?",
                        style: MyTextStyle.w4s16(),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed(RoutesName.login);
                        },
                        child: Text(
                          "Sign In",
                          style: MyTextStyle.w4s16().copyWith(
                            color: AppColors.primaryColor,
                          ),
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
