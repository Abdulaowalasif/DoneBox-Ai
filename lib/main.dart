import 'package:doneboxai/core/bindings/apps_binding.dart';
import 'package:doneboxai/core/theme/theme.dart';
import 'package:doneboxai/routes/app_routes.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyAppThemes.lightTheme(),
      themeMode: ThemeMode.light,
      initialRoute: RoutesName.onboarding1,
      getPages: AppRoutes.pages,
      initialBinding: AppBinding(),
    );
  }
}
