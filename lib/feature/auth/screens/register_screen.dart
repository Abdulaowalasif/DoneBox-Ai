import 'package:doneboxai/feature/auth/controller/register_controller.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_fields.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find<RegisterController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign Up to\nyour account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Welcome Back! Please Enter Your Details.",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                SizedBox(height: 40),

                const Text(
                  "Your Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),

                // Email field
                CustomTextField(
                  hintText: "Enter Name",
                  icon: Icons.person_outline,
                  controller: controller.nameController,
                ),
                const SizedBox(height: 20),

                const Text(
                  "Your Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),

                // Email field
                CustomTextField(
                  hintText: "Enter Email",
                  icon: Icons.email_outlined,
                  controller: controller.emailController,
                ),
                const SizedBox(height: 20),

                const Text(
                  "Phone",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),

                // Email field
                CustomTextField(
                  hintText: "Enter Your Phone Number",
                  icon: Icons.phone,
                  controller: controller.phoneController,
                ),
                const SizedBox(height: 20),

                const Text(
                  "Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),

                // Password field with eye toggle
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
                        value: controller.isAgreed.value,
                        onChanged: (value) => controller.toggleCheckBox(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      'By creating an account, I accept the Terms & Conditions\n& Privacy Policy.',
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Sign in button
                CustomButton(
                  text: "Sign Up",
                  onPressed: () {
                    Get.offAllNamed(RoutesName.login);
                  },
                ),
                const SizedBox(height: 20),

                // Sign up link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already Have An Account?"),
                    TextButton(
                      onPressed: () {
                        Get.offAllNamed(RoutesName.login);
                      },
                      child: const Text("Sign In"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
