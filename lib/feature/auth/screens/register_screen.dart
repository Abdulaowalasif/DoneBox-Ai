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
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      "Sign Up to\nyour account",
                      style: MyTextStyle.w6s30(context),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Welcome Back! Please Enter Your Details.",
                      style: MyTextStyle.w4s16(context),
                    ),
                    SizedBox(height: screenSize.height * 0.05),

                    // ---- First and Last name ----
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your First Name",
                                style: MyTextStyle.w4s18(context),
                              ),
                              const SizedBox(height: 8),
                              CustomTextField(
                                hintText: "Enter First Name",
                                icon: Icons.person_outline,
                                controller: controller.firstNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "First name is required";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your Last Name",
                                style: MyTextStyle.w4s18(context),
                              ),
                              const SizedBox(height: 8),
                              CustomTextField(
                                hintText: "Enter Last Name",
                                icon: Icons.person_outline,
                                controller: controller.lastNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Last name is required";
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // ---- Email ----
                    Text("Your Email", style: MyTextStyle.w4s18(context)),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText: "Enter Email",
                      icon: Icons.email_outlined,
                      controller: controller.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }
                        if (!GetUtils.isEmail(value)) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // ---- Phone ----
                    Text("Phone", style: MyTextStyle.w4s18(context)),
                    const SizedBox(height: 8),
                    CustomTextField(
                      hintText: "Enter Your Phone Number",
                      icon: Icons.phone,
                      controller: controller.phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Phone number is required";
                        }
                        if (!GetUtils.isPhoneNumber(value)) {
                          return "Enter a valid phone number";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // ---- Password ----
                    Text("Password", style: MyTextStyle.w4s18(context)),
                    const SizedBox(height: 8),
                    Obx(
                      () => CustomTextField(
                        hintText: "Enter Password",
                        icon: Icons.lock_outline,
                        obscureText: controller.isPasswordHidden.value,
                        controller: controller.passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
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

                    const SizedBox(height: 20),

                    // ---- Confirm Password ----
                    Text("Confirm Password", style: MyTextStyle.w4s18(context)),
                    const SizedBox(height: 8),
                    Obx(
                      () => CustomTextField(
                        hintText: "Enter Confirm Password",
                        icon: Icons.lock_outline,
                        obscureText: controller.isConfirmPasswordHidden.value,
                        controller: controller.confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please confirm your password";
                          }
                          if (value != controller.passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
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

                    const SizedBox(height: 15),

                    // ---- Terms & Conditions ----
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Checkbox(
                            activeColor: AppColors.buttonColor,
                            value: controller.isAgreed.value,
                            onChanged: (value) => controller.toggleCheckBox(),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                              children: [
                                const TextSpan(
                                  text:
                                      'By creating an account, I accept the terms & condition  &\n',
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: MyTextStyle.w4s16(context).copyWith(
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
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // ---- Sign Up Button ----
                    Obx(
                      () => CustomButton(
                        width: double.infinity,
                        text: "Sign Up",
                        isLoading: controller.isLoading.value,
                        isEnabled: controller.isAgreed.value,
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            if (!controller.isAgreed.value) {
                              return;
                            }
                            controller.register();
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ---- Already have an account ----
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have An Account?",
                          style: MyTextStyle.w4s16(context),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.offAllNamed(RoutesName.login);
                          },
                          child: Text(
                            "Sign In",
                            style: MyTextStyle.w4s16(
                              context,
                            ).copyWith(color: AppColors.primaryColor),
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
      ),
    );
  }
}
