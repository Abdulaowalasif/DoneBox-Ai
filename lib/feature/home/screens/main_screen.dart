import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/feature/hub/screens/hub_screen.dart';
import 'package:doneboxai/feature/menu/bindings/main_menu_binding.dart';
import 'package:doneboxai/feature/menu/screens/menu_screens.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../../calender/screens/custom_calendar_screen.dart';
import '../controllers/bottom_nav_controller.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'home_screens.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key}) {
    MainMenuBinding().dependencies();
  }

  final BottomNavController controller = Get.find();

  final List<Widget> pages = [
    HomeScreens(),
    HubScreen(),
    CalendarScreen(),
    MenuScreens(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: Obx(
            () => IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        ),
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: AppColors.buttonColor,
        foregroundColor: Colors.white,
        icon: Icons.add,
        activeIcon: Icons.close,
        spacing: 10,
        spaceBetweenChildren: 12,
        shape: const StadiumBorder(),

        children: [
          SpeedDialChild(
            backgroundColor: const Color(0xFFD9E7F2),
            label: "Ai Assistant",
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            child: Image.asset(
              ImageConst.floatingAi,
              height: 28,
            ),
            onTap: () {
              Get.toNamed(RoutesName.aiAssistant);
            },
          ),
          SpeedDialChild(
            backgroundColor: const Color(0xFFD9E7F2),
            label: "Manual",
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            child: Image.asset(
              ImageConst.hand,
              height: 28,
            ),
            onTap: () {
              Get.toNamed(RoutesName.createNewTask);
            },
          ),
        ],
      ),
    );
  }
}
