import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/my_text_style.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conts/image_icon_const.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(width * 0.05),
        // responsive padding
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConst.centerBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.04),
              Text(
                "Organize Your Day",
                style: MyTextStyle.onboardingText1(context)
              ),
              SizedBox(height: height * 0.02),
              Text(
                "Manage Tasks with Ease and Precision",
                style: MyTextStyle.onboardingText2(context)
              ),
              SizedBox(height: height * 0.05),
              Center(
                child: Image.asset(
                  ImageConst.onboarding1,
                  height: height * 0.50, // responsive image size
                  fit: BoxFit.contain,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),

    );
  }
}
