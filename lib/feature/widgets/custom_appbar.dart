import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/conts/my_text_style.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onPress;
  final int? navIds;
  final IconData? trailing;
  final bool? hideBackButton;

  const CustomAppbar({
    super.key,
    required this.title,
    this.navIds,
    this.trailing,
    required this.onPress,
    this.hideBackButton = false,
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
            hideBackButton == false
                ? Align(
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
                  )
                : SizedBox(),
            Center(
              child: Text(
                title,
                style: MyTextStyle.w5s20().copyWith(color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: onPress,
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
