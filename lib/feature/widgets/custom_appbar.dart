import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? route;
  final int? navIds;
  final IconData? trailing;

  const CustomAppbar({
    super.key,
    required this.title,
    this.navIds,
    this.trailing,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 125,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  if (navIds == null) {
                    Get.back();
                  } else {
                    Get.back(id: navIds);
                  }
                },
                icon: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Get.toNamed(route!);
                },
                icon: Icon(trailing, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
