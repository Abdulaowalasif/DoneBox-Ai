import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/my_text_style.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conts/image_icon_const.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

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
              SizedBox(height: height * 0.05),
              Center(
                child: Image.asset(
                  ImageConst.onboarding1,
                  height: height * 0.50,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: height * 0.04),
              Text(
                "AI at Your Service",
                style: MyTextStyle.onboardingText1(context),
              ),
              SizedBox(height: height * 0.02),
              Text(
                "Let DoneBox Help You Stay on Track",
                style: MyTextStyle.onboardingText2(context),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.02),
                child: Text(
                  "Start Exploring!",
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
