import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conts/image_icon_const.dart';
import '../../../routes/routes_names.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(width * 0.05),
        // 5% padding of screen width
        height: double.infinity,
        width: double.infinity,
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
              SizedBox(height: height * 0.08),
              Center(
                child: Image.asset(
                  ImageConst.onboarding1,
                  height: height * 0.50, // 35% of screen height
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: height * 0.04),
              Text(
                "Welcome to DoneBox",
                style: MyTextStyle.onboardingText1(context),
              ),
              SizedBox(height: height * 0.02),
              Text(
                "Your Smart Task Manager",
                style: MyTextStyle.onboardingText2(context),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),

    );
  }
}
