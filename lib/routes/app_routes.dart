import 'package:doneboxai/feature/auth/screens/forgot_password_screen.dart';
import 'package:doneboxai/feature/auth/screens/login_screen.dart';
import 'package:doneboxai/feature/auth/screens/register_screen.dart';
import 'package:doneboxai/feature/auth/screens/reset_password_screen.dart';
import 'package:doneboxai/feature/auth/screens/verify_code_screen.dart';
import 'package:doneboxai/feature/calender/screens/custom_calendar_screen.dart';
import 'package:doneboxai/feature/home/bindings/EditTaskBinding.dart';
import 'package:doneboxai/feature/home/bindings/ai_task_create_binding.dart';
import 'package:doneboxai/feature/home/bindings/main_screen_binding.dart';
import 'package:doneboxai/feature/home/bindings/task_details_binding.dart';
import 'package:doneboxai/feature/home/screens/ai_task_create_screen.dart';
import 'package:doneboxai/feature/home/screens/edit_task_screen.dart';
import 'package:doneboxai/feature/home/screens/home_screens.dart';
import 'package:doneboxai/feature/home/screens/task_details_screen.dart';
import 'package:doneboxai/feature/hub/bindings/focus_mode_binding.dart';
import 'package:doneboxai/feature/hub/screens/focus_mode_screen.dart';
import 'package:doneboxai/feature/hub/screens/hub_screen.dart';
import 'package:doneboxai/feature/menu/bindings/main_menu_binding.dart';
import 'package:doneboxai/feature/menu/screens/community_forum_screen.dart';
import 'package:doneboxai/feature/menu/screens/email_support_screen.dart';
import 'package:doneboxai/feature/menu/screens/get_started_screen.dart';
import 'package:doneboxai/feature/menu/screens/help_and_support_screen.dart';
import 'package:doneboxai/feature/menu/screens/insights_screen.dart';
import 'package:doneboxai/feature/menu/screens/live_chat_screen.dart';
import 'package:doneboxai/feature/menu/screens/menu_screens.dart';
import 'package:doneboxai/feature/menu/screens/notes_screen.dart';
import 'package:doneboxai/feature/menu/screens/privacy_policy_screen.dart';
import 'package:doneboxai/feature/menu/screens/product_update_screen.dart';
import 'package:doneboxai/feature/menu/screens/profile_screen.dart';
import 'package:doneboxai/feature/menu/screens/report_bug_screen.dart';
import 'package:doneboxai/feature/menu/screens/subscription_screen.dart';
import 'package:doneboxai/feature/notification/bindings/notification_binding.dart';
import 'package:doneboxai/feature/notification/bindings/notification_pref_binding.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen2.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen3.dart';
import 'package:doneboxai/feature/onboarding/screens/onboarding_screen4.dart';
import 'package:doneboxai/feature/quick%20action/screens/quick_action_screen.dart';
import 'package:doneboxai/feature/tasks/bindings/ai_assistant_binding.dart';
import 'package:doneboxai/feature/tasks/bindings/create_new_task_binding.dart';
import 'package:doneboxai/feature/tasks/screens/ai_task_assistant_screen.dart';
import 'package:doneboxai/feature/tasks/screens/create_new_task_screen.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:get/get.dart';

import '../feature/home/screens/main_screen.dart';
import '../feature/notification/screens/notification_preference_screen.dart';
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
      binding: MainScreenBinding(),
      name: RoutesName.mainScreen,
      page: () => MainScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.quickAction,
      page: () => QuickActionScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      binding: NotificationBinding(),
      name: RoutesName.notification,
      page: () => NotificationScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      binding: NotificationPrefBinding(),
      name: RoutesName.notificationPref,
      page: () => NotificationPreferenceScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      binding: AiAssistantBinding(),
      name: RoutesName.aiAssistant,
      page: () => AiTaskAssistantScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      binding: CreateNewTaskBinding(),
      name: RoutesName.createNewTask,
      page: () => CreateNewTaskScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      binding: FocusModeBinding(),
      name: RoutesName.focusMode,
      page: () => FocusModeScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      binding: AiTaskCreateBinding(),
      name: RoutesName.aiTaskCreate,
      page: () => AiTaskCreateScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      binding: TaskDetailsBinding(),
      name: RoutesName.taskDetails,
      page: () => TaskDetailsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      binding: EditTaskBinding(),
      name: RoutesName.editTask,
      page: () => EditTaskScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.notes,
      page: () => NotesScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.profile,
      page: () => ProfileScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.subscription,
      page: () => SubscriptionScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.privacyPolicy,
      page: () => PrivacyPolicyScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.helpAndSupport,
      page: () => HelpAndSupportScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.insight,
      page: () => InsightsScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.getStarted,
      page: () => GetStartedScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.liveChat,
      page: () => LiveChatScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.emailSupport,
      page: () => EmailSupportScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.reportBug,
      page: () => ReportBugScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.communityForum,
      page: () => CommunityForumScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.productUpdate,
      page: () => ProductUpdateScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      binding: MainMenuBinding(),
      name: RoutesName.menu,
      page: () => MenuScreens(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.home,
      page: () => HomeScreens(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.hub,
      page: () => HubScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RoutesName.calender,
      page: () => CalendarScreen(),
      transition: Transition.rightToLeft,
    ),
  ];
}
