import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../core/image_string/image_icon_const.dart';
import '../home/controller/bottom_nav_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.bottomNavController});

  final BottomNavController bottomNavController;

  Widget buildIcon(String asset, int index) {
    return Image.asset(
      asset,
      color: bottomNavController.selectedIndex.value == index
          ? Colors.blue
          : Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: bottomNavController.selectedIndex.value,
        onTap: (index) {
          bottomNavController.selectedIndex.value = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: buildIcon(ImageConst.navHome, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: buildIcon(ImageConst.navEmail, 1),
            label: 'Email',
          ),
          BottomNavigationBarItem(
            icon: buildIcon(ImageConst.navAdd, 2),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: buildIcon(ImageConst.navCalender, 3),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: buildIcon(ImageConst.navProfile, 4),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
