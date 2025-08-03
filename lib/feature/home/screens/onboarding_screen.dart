import 'package:doneboxai/core/image_string/image_icon_const.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Checkbox(
                    fillColor: MaterialStateProperty.all(Colors.blue),
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    "DoneBox",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.06,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.05),
              Image.asset(
                ImageConst.onboarding,
                height: screenHeight * 0.35,
                width: screenWidth * 0.9,
                fit: BoxFit.cover,
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                'Welcome to DoneBox',
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'The best tools to organize your tasks',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: CustomButton(
                  text: 'Get Started',
                  onPressed: () {
                    Get.offAllNamed(RoutesName.home);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
