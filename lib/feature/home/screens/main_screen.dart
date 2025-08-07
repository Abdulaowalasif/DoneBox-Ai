import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/feature/home/navigator/home_navigator.dart';
import 'package:doneboxai/feature/home/screens/add_screen.dart';
import 'package:doneboxai/feature/home/screens/calender_screen.dart';
import 'package:doneboxai/feature/home/screens/email_screen.dart';
import 'package:doneboxai/feature/home/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../controller/bottom_nav_controller.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController =
        Get.find<BottomNavController>();

    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: bottomNavController.selectedIndex.value,
          children: const [
            HomeNavigator(),
            EmailScreen(),
            AddScreen(),
            CalenderScreen(),
            ProfileScreen(),
          ],
        );
      }),
      bottomNavigationBar: BottomNavBar(
        bottomNavController: bottomNavController,
      ),
    );
  }
}
