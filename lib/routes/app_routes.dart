import 'package:doneboxai/feature/auth/screens/forgot_password_screen.dart';
import 'package:doneboxai/feature/auth/screens/login_screen.dart';
import 'package:doneboxai/feature/auth/screens/register_screen.dart';
import 'package:doneboxai/feature/auth/screens/reset_password_screen.dart';
import 'package:doneboxai/feature/auth/screens/verify_code_screen.dart';
import 'package:doneboxai/feature/hub/screens/focus_mode_screen.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen2.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen3.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen4.dart';
import 'package:doneboxai/feature/quick%20action/screens/quick_action_screen.dart';
import 'package:doneboxai/feature/tasks/screens/ai_task_assistant.dart';
import 'package:doneboxai/feature/tasks/screens/create_new_task.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:get/get.dart';

import '../feature/home/screens/main_screen.dart';
import '../feature/notification/screens/notification_preference.dart';
import '../feature/notification/screens/notification_screen.dart';

class AppRoutes {
  static List<GetPage> pages = [
    //authentication
    GetPage(
      name: RoutesName.forgotPass,
      page: () => ForgotPasswordScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.login,
      page: () => LoginScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.register,
      page: () => RegisterScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.resetPass,
      page: () => ResetPasswordScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.verifyOtp,
      page: () => VerifyCodeScreen(),
      transition: Transition.rightToLeft,
    ),
    //onboarding
    GetPage(
      name: RoutesName.onboarding1,
      page: () => OnboardingPager(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.onboarding2,
      page: () => OnboardingScreen2(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.onboarding3,
      page: () => OnboardingScreen3(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.onboarding4,
      page: () => OnboardingScreen4(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.mainScreen,
      page: () => MainScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.quickAction,
      page: () => QuickActionScreen(),
      transition: Transition.rightToLeft,
    ),GetPage(
      name: RoutesName.notification,
      page: () => NotificationScreen(),
      transition: Transition.rightToLeft,
    ),GetPage(
      name: RoutesName.notificationPref,
      page: () => NotificationPreference(),
      transition: Transition.rightToLeft,
    ),GetPage(
      name: RoutesName.aiAssistant,
      page: () => AiTaskAssistant(),
      transition: Transition.rightToLeft,
    ),GetPage(
      name: RoutesName.createNewTask,
      page: () => CreateNewTask(),
      transition: Transition.rightToLeft,
    ),GetPage(
      name: RoutesName.focusMode,
      page: () => FocusModeScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
