import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/settings_item.dart';

class MenuScreens extends StatelessWidget {
  const MenuScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Settings", onPress: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              //user profile header section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 20,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 30,
                        backgroundImage: AssetImage(ImageConst.user),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Chester Bennington",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Chester@gmail.com",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Upgrade",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              //productivity tools section
              Text(
                "Productivity Tools",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.secondaryColor, width: 1),
                ),
                child: Column(
                  children: [
                    SettingsItem(
                      icon: Icons.event_note,
                      title: "Notes",
                      onPress: () => Get.toNamed(RoutesName.notes),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.secondaryColor,
                      width: double.infinity,
                    ),
                    SettingsItem(
                        onPress: () => Get.toNamed(RoutesName.insight),
                        icon: Icons.network_cell, title: "Insights"),
                  ],
                ),
              ),
              //settings and profile section
              Text(
                "Settings & Profile",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.secondaryColor, width: 1),
                ),
                child: Column(
                  children: [
                    SettingsItem(
                      icon: Icons.nightlight_outlined,
                      title: "Dark Mode",
                      showToggle: true,
                    ),
                    Container(
                      height: 1,
                      color: AppColors.secondaryColor,
                      width: double.infinity,
                    ),
                    SettingsItem(
                      icon: Icons.notifications_none,
                      title: "Pause Notification",
                      showToggle: true,
                    ),
                    Container(
                      height: 1,
                      color: AppColors.secondaryColor,
                      width: double.infinity,
                    ),
                    SettingsItem(
                      onPress: () => Get.toNamed(RoutesName.notificationPref),
                      icon: Icons.notification_add_outlined,
                      title: "Notification Preferences",
                    ),
                    Container(
                      height: 1,
                      color: AppColors.secondaryColor,
                      width: double.infinity,
                    ),
                    SettingsItem(
                      onPress: () => Get.toNamed(RoutesName.subscription),
                      icon: Icons.subscriptions_outlined,
                      title: "Subscription Tier",
                    ),
                    Container(
                      height: 1,
                      color: AppColors.secondaryColor,
                      width: double.infinity,
                    ),
                    SettingsItem(
                      onPress: () {
                        Get.toNamed(RoutesName.profile);
                      },
                      icon: Icons.settings,
                      title: "Account Settings",
                    ),
                    Container(
                      height: 1,
                      color: AppColors.secondaryColor,
                      width: double.infinity,
                    ),
                    SettingsItem(
                      onPress: () => Get.toNamed(RoutesName.helpAndSupport),
                      icon: Icons.help_outline,
                      title: "Help & Support",
                    ),
                    Container(
                      height: 1,
                      color: AppColors.secondaryColor,
                      width: double.infinity,
                    ),
                    SettingsItem(
                      onPress: () => Get.toNamed(RoutesName.privacyPolicy),
                      icon: Icons.lock_open,
                      title: "Privacy & Policy",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
