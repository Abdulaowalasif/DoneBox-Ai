import 'package:doneboxai/feature/auth/screens/forgot_password_screen.dart';
import 'package:doneboxai/feature/auth/screens/login_screen.dart';
import 'package:doneboxai/feature/auth/screens/register_screen.dart';
import 'package:doneboxai/feature/auth/screens/reset_password_screen.dart';
import 'package:doneboxai/feature/auth/screens/verify_code_screen.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen1.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen2.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen3.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen4.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:get/get.dart';

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
  ];
}
