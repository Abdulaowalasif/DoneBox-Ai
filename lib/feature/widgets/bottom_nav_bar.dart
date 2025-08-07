import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

import '../../core/conts/image_icon_const.dart';
import '../home/controller/bottom_nav_controller.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key, required this.bottomNavController});

  final BottomNavController bottomNavController;

  final List<int> _navigationHistory = [0];

  Widget buildIcon(String asset, int index) {
    return Image.asset(
      asset,
      color: bottomNavController.selectedIndex.value == index
          ? Colors.blue
          : Colors.grey,
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    if (bottomNavController.selectedIndex.value == 0) {
      SystemNavigator.pop();
      return false;
    } else if (_navigationHistory.length > 1) {
      _navigationHistory.removeLast();
      bottomNavController.selectedIndex.value = _navigationHistory.last;
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: bottomNavController.selectedIndex.value,
          onTap: (index) {
            if (index == 0) {
              bottomNavController.selectedIndex.value = index;
            } else {
              if (bottomNavController.selectedIndex.value != index) {
                _navigationHistory.add(index);
              }
              bottomNavController.selectedIndex.value = index;
            }
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
      ),
    );
  }
}
