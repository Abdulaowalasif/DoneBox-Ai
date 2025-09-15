import 'package:doneboxai/core/bindings/apps_binding.dart';
import 'package:doneboxai/core/conts/app_consts.dart';
import 'package:doneboxai/core/storage/app_storage.dart';
import 'package:doneboxai/core/theme/theme.dart';
import 'package:doneboxai/routes/app_routes.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage.initStorage();
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
      initialRoute: RoutesName.onboarding4,
      getPages: AppRoutes.pages,
      initialBinding: AppBinding(),
    );
  }
}
