import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/auth/controller/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_button.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OtpController>();
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verify Code",
                  style: TextStyle(
                    fontSize: isPortrait ? 24 : 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Please check your email and enter the code",
                  style: TextStyle(fontSize: isPortrait ? 14 : 16),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: TextFormField(
                          controller: controller.controllers[index],
                          focusNode: controller.focusNodes[index],
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) =>
                              controller.onOtpEntered(value, index),
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: AppColors.otpFieldColor,
                            contentPadding: EdgeInsets.zero,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Color(0xff005fa8),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Color(0xff005fa8),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '2:32',
                    style: TextStyle(
                      color: AppColors.buttonColor,
                      fontWeight: FontWeight.w700,
                      fontSize: isPortrait ? 22 : 24,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  width: double.infinity,
                  text: "Verify Otp",
                  onPressed: () {
                    controller.verifyOtp(context);
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Didn’t receive code?"),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Resend it",
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
    );
  }
}
