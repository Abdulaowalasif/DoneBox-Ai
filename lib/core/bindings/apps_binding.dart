import 'package:doneboxai/feature/auth/controller/forgot_pass_controller.dart';
import 'package:doneboxai/feature/auth/controller/login_controller.dart';
import 'package:doneboxai/feature/auth/controller/otp_controller.dart';
import 'package:doneboxai/feature/auth/controller/register_controller.dart';
import 'package:doneboxai/feature/auth/controller/reset_pass_controller.dart';
import 'package:doneboxai/feature/home/controller/action_controller.dart';
import 'package:doneboxai/feature/home/controller/bottom_nav_controller.dart';
import 'package:doneboxai/feature/home/controller/calender_controller.dart';
import 'package:doneboxai/feature/home/controller/new_event_controller.dart';
import 'package:doneboxai/feature/home/controller/new_task_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController(), fenix: true,);
    Get.lazyPut<OtpController>(() => OtpController(), fenix: true);
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController(), fenix: true,);
    Get.lazyPut<BottomNavController>(() => BottomNavController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<NewTaskController>(() => NewTaskController(), fenix: true);
    Get.lazyPut<NewEventController>(() => NewEventController(), fenix: true);
    Get.lazyPut<ActionController>(() => ActionController(), fenix: true);
    Get.lazyPut<CalenderController>(() => CalenderController(), fenix: true);
  }
}
