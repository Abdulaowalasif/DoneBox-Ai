import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  final BottomNavController controller = Get.find();

  CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(ImageConst.home, "Home", 0),
            _buildNavItem(ImageConst.hub, "Hub", 1),
            _buildNavItem(ImageConst.calender, "Calendar", 2),
            _buildNavItem(ImageConst.menu, "Menu", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String icon, String label, int index) {
    bool isSelected = controller.selectedIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changeIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(icon, color: isSelected ? Colors.blue : Colors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
