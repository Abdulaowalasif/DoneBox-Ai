import 'package:doneboxai/feature/auth/controller/forgot_pass_controller.dart';
import 'package:doneboxai/feature/auth/controller/login_controller.dart';
import 'package:doneboxai/feature/auth/controller/otp_controller.dart';
import 'package:doneboxai/feature/auth/controller/register_controller.dart';
import 'package:doneboxai/feature/auth/controller/reset_pass_controller.dart';
import 'package:doneboxai/feature/home/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ForgotPasswordController>(
      ForgotPasswordController(),
      permanent: true,
    );
    Get.put<OtpController>(OtpController(), permanent: true);
    Get.put<RegisterController>(RegisterController(), permanent: true);
    Get.put<ResetPasswordController>(
      ResetPasswordController(),
      permanent: true,
    );
    Get.put<BottomNavController>(BottomNavController(), permanent: true);
    Get.put<LoginController>(LoginController(), permanent: true);
  }
}
