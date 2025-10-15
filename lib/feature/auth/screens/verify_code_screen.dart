import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/my_text_style.dart';
import 'package:doneboxai/feature/auth/controller/otp_controller.dart';
import 'package:doneboxai/feature/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/conts/image_icon_const.dart';
import '../widgets/custom_button.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OtpController>();
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final arg = Get.arguments;

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppIcon(),
                  SizedBox(height: height * 0.02),

                  /// Title
                  Text("Verify Code", style: MyTextStyle.w6s30(context)),
                  const SizedBox(height: 8),

                  /// Subtitle
                  Text(
                    "Please check your email and enter the code",
                    style: MyTextStyle.w4s16(context),
                  ),
                  SizedBox(height: height * 0.06),

                  /// OTP Fields
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: width * 0.02,
                      runSpacing: height * 0.01,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          width: width * 0.12, // scales with screen
                          height: width * 0.14, // scales with screen
                          child: TextFormField(
                            controller: controller.controllers[index],
                            focusNode: controller.focusNodes[index],
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            style: MyTextStyle.w5s20(context),
                            keyboardType: TextInputType.number,
                            onChanged: (value) =>
                                controller.onOtpEntered(value, index),
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: AppColors.secondaryColor,
                              contentPadding: EdgeInsets.zero,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: height * 0.03),

                  /// Verify Button
                  Obx(
                    () => controller.isLoading.value
                        ? CustomButton(
                            text: "Verify Otp",
                            onPressed: () {},
                            width: double.infinity,
                            isLoading: true,
                          )
                        : CustomButton(
                            width: double.infinity,
                            text: "Verify OTP",
                            onPressed: () {
                              if (arg == "create_account") {
                                controller.verifyCode();
                              } else {
                                controller.verifyResetCode();
                              }
                            },
                          ),
                  ),
                  SizedBox(height: height * 0.03),

                  /// Timer
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '2:32',
                      style: MyTextStyle.w5s18(
                        context,
                      ).copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                  SizedBox(height: height * 0.02),

                  /// Resend
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn’t receive code?",
                        style: MyTextStyle.w4s16(context),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Resend it",
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
