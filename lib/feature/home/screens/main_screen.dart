import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/feature/hub/screens/hub_screen.dart';
import 'package:doneboxai/feature/menu/screens/menu_screens.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../calender/screens/custom_calendar.dart';
import '../controllers/bottom_nav_controller.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'home_screens.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final BottomNavController controller = Get.find();

  final List<Widget> pages = [
    const HomeScreens(),
    const HubScreen(),
    CalendarScreen(),
    const MenuScreens(),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.buttonColor,
        shape: const StadiumBorder(),
        onPressed: () {
          Get.dialog(
            Dialog(
              backgroundColor: Colors.white,
              child: SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.toNamed(RoutesName.aiAssistant);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFFD9E7F2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          spacing: 10,
                          children: [
                            Image.asset(ImageConst.floatingAi),
                            Text(
                              "Ai Assistant",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.toNamed(RoutesName.createNewTask);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xFFD9E7F2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          spacing: 10,
                          children: [
                            Image.asset(ImageConst.hand),
                            Text(
                              "Manual",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add, size: 32, color: Colors.white),
      ),
    );
  }
}
