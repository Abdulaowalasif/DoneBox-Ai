import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/core/conts/navIds.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/conts/app_colors.dart';

class ChooseItem extends StatelessWidget {
  const ChooseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose one',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ItemContainer(
              title: 'New Task',
              onPressed: () {
                // Get.toNamed(RoutesName.newTask, id: NavIds.home);
              },
              image: ImageConst.newTask,
            ),
            ItemContainer(
              image: ImageConst.newEvent,
              title: 'New Event',
              onPressed: () {
                // Get.toNamed(RoutesName.newEvent, id: NavIds.home);
              },
            ),
            ItemContainer(
              image: ImageConst.newNote,
              title: 'New Note',
              onPressed: () {
                // Get.toNamed(RoutesName.newNote, id: NavIds.home);
              },
            ),
          ],
        ),
      ],
    );
  }
}

class ItemContainer extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onPressed;

  const ItemContainer({
    super.key,
    required this.title,
    required this.onPressed,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.otpFieldColor, width: 2),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image),
              Text(
                title,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
