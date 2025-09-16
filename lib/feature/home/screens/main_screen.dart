import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/core/conts/my_text_style.dart';
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
    CalendarScreen(),
    HubScreen(),
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
            backgroundColor: AppColors.secondaryColor,
            label: "Ai Assistant",
            labelBackgroundColor: AppColors.secondaryColor,
            labelStyle: MyTextStyle.w4s16(),
            child: Image.asset(ImageConst.floatingAi, height: 28),
            onTap: () {
              Get.toNamed(RoutesName.aiAssistant);
            },
          ),
          SpeedDialChild(
            backgroundColor: AppColors.secondaryColor,
            label: "Manual",
            labelBackgroundColor: AppColors.secondaryColor,
            labelStyle: MyTextStyle.w4s16(),
            child: Image.asset(ImageConst.hand, height: 28),
            onTap: () {
              Get.toNamed(RoutesName.createNewTask);
            },
          ),
        ],
      ),
    );
  }
}
