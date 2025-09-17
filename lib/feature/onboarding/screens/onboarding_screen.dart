import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/app_consts.dart';
import 'package:doneboxai/core/conts/my_text_style.dart';
import 'package:doneboxai/core/storage/app_storage.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen1.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen2.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/conts/image_icon_const.dart';
import '../controller/onboarding_controller.dart';

class OnboardingPager extends StatelessWidget {
  const OnboardingPager({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConst.centerBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    AppStorage.write(AppConstants.firstTime, false);
                    controller.skip();
                  },
                  child: Text(
                    "Skip",
                    style:MyTextStyle.w7s20()
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  children: const [
                    OnboardingScreen1(),
                    OnboardingScreen2(),
                    OnboardingScreen3(),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: width * 0.18, // responsive size
        width: width * 0.18,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Obx(
              () => CircularProgressIndicator(
                value: controller.updateProgress(),
                strokeAlign: width * 0.025,
                color: AppColors.primaryColor,
                backgroundColor: AppColors.secondaryColor,
              ),
            ),
            FloatingActionButton(
              splashColor: AppColors.secondaryColor,
              elevation: 0,
              shape: const CircleBorder(),
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                controller.currentPage.value == 2
                    ? AppStorage.write(AppConstants.firstTime, false)
                    : AppStorage.write(AppConstants.firstTime, true);
                controller.nextPage();
              },
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: width * 0.07,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
