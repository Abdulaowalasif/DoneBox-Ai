import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/app_consts.dart';
import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/core/storage/app_storage.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conts/my_text_style.dart';
import '../../widgets/app_icon.dart';

class OnboardingScreen4 extends StatefulWidget {
  const OnboardingScreen4({super.key});

  @override
  State<OnboardingScreen4> createState() => _OnboardingScreen4State();
}

class _OnboardingScreen4State extends State<OnboardingScreen4> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      final firstTime = AppStorage.read(AppConstants.firstTime);
      final access = AppStorage.read(AppConstants.accessToken);

      if (firstTime == null || firstTime == true) {
        Get.offAllNamed(RoutesName.onboarding1);
      } else if (access != null) {
        Get.offAllNamed(RoutesName.mainScreen);
      } else {
        Get.offAllNamed(RoutesName.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConst.centerBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppIcon(),
                SizedBox(height: height * 0.05),
                Image.asset(
                  ImageConst.onboarding4,
                  height: height * 0.50, // responsive image size
                  fit: BoxFit.contain,
                ),
                SizedBox(height: height * 0.04),
                Text(
                  "Your Personal Task Manager Powered by AI",
                  style: MyTextStyle.onboardingText2(context),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
