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
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<OtpController>(() => OtpController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
