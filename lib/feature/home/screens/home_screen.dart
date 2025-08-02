import 'package:doneboxai/core/image_string/image_icon_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../controller/bottom_nav_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController =
        Get.find<BottomNavController>();

    return Scaffold(
      body: Center(
        child: Text('Selected index: ${bottomNavController.selectedIndex}'),
      ),
      bottomNavigationBar: BottomNavBar(
        bottomNavController: bottomNavController,
      ),
    );
  }
}
