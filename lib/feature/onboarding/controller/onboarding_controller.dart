import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/routes_names.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;
  RxDouble progress = 0.33.obs;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(RoutesName.onboarding4);
    }
  }

  void skip() {
    Get.offAllNamed(RoutesName.onboarding4);
  }

  double updateProgress() {
    return progress.value = (currentPage.value + 1) / 3;
  }
}
