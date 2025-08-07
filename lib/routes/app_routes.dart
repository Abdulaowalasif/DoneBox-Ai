import 'package:doneboxai/feature/auth/screens/forgot_password_screen.dart';
import 'package:doneboxai/feature/auth/screens/login_screen.dart';
import 'package:doneboxai/feature/auth/screens/register_screen.dart';
import 'package:doneboxai/feature/auth/screens/reset_password_screen.dart';
import 'package:doneboxai/feature/auth/screens/verify_code_screen.dart';
import 'package:doneboxai/feature/home/screens/action_screen.dart';
import 'package:doneboxai/feature/home/screens/home_screen.dart';
import 'package:doneboxai/feature/home/screens/main_screen.dart';
import 'package:doneboxai/feature/home/screens/new_event_screen.dart';
import 'package:doneboxai/feature/home/screens/new_note_screen.dart';
import 'package:doneboxai/feature/home/screens/new_task_screen.dart';
import 'package:doneboxai/feature/home/screens/onboarding_screen.dart';
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
      name: RoutesName.onboarding,
      page: () => OnboardingScreen(),
      transition: Transition.rightToLeft,
    ),
    //home
    GetPage(
      name: RoutesName.main,
      page: () => MainScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.home,
      page: () => HomeScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.newNote,
      page: () => NewNoteScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.newTask,
      page: () => NewTaskScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.newEvent,
      page: () => NewEventScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.actions,
      page: () => ActionScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
