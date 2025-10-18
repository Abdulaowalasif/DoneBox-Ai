import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/feature/menu/controllers/main_menu_controller.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conts/my_text_style.dart';
import '../widgets/settings_item.dart';

class MenuScreens extends StatelessWidget {
  const MenuScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final MainMenuController controller = Get.find();
    return Scaffold(
      appBar: CustomAppbar(
        title: "Settings",
        onPress: () {},
        hideBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              //user profile header section
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 25,
                  backgroundImage: AssetImage(ImageConst.user),
                ),
                title: Text(
                  "Chester Bennington",
                  style: MyTextStyle.w5s16(context),
                ),
                subtitle: Text(
                  "Chester@gmail.com",
                  style: MyTextStyle.w4s12(context).copyWith(fontSize: 14),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Upgrade",
                    style: MyTextStyle.w5s16(
                      context,
                    ).copyWith(color: AppColors.primaryColor),
                  ),
                ),
              ),
              //productivity tools section
              Text("Productivity Tools", style: MyTextStyle.w5s20(context)),
              Column(
                spacing: 5,
                children: [
                  SettingsItem(
                    icon: Icons.event_note,
                    title: "Notes",
                    onPress: () => Get.toNamed(RoutesName.notes),
                  ),
                  SettingsItem(
                    onPress: () => Get.toNamed(RoutesName.insight),
                    icon: Icons.network_cell,
                    title: "Insights",
                  ),
                ],
              ),
              //settings and profile section
              Text("Settings & Profile", style: MyTextStyle.w5s20(context)),
              Column(
                spacing: 5,
                children: [
                  Obx(
                    () => SettingsItem(
                      isActive: controller.pauseNotification.value,
                      icon: Icons.notifications_none,
                      title: "Pause Notification",
                      showToggle: true,
                      toggleChanged: () => controller.pauseNotification.value =
                          !controller.pauseNotification.value,
                    ),
                  ),
                  SettingsItem(
                    onPress: () => Get.toNamed(RoutesName.notificationPref),
                    icon: Icons.notification_add_outlined,
                    title: "Notification Preferences",
                  ),
                  SettingsItem(
                    onPress: () => Get.toNamed(RoutesName.subscription),
                    icon: Icons.subscriptions_outlined,
                    title: "Subscription Tier",
                  ),

                  SettingsItem(
                    onPress: () {
                      Get.toNamed(RoutesName.profile);
                    },
                    icon: Icons.settings,
                    title: "Account Settings",
                  ),

                  SettingsItem(
                    onPress: () => Get.toNamed(RoutesName.helpAndSupport),
                    icon: Icons.help_outline,
                    title: "Help & Support",
                  ),

                  SettingsItem(
                    onPress: () => Get.toNamed(RoutesName.privacyPolicy),
                    icon: Icons.lock_open,
                    title: "Privacy & Policy",
                  ),
                  SettingsItem(
                    onPress: () => controller.logout(),
                    icon: Icons.login_outlined,
                    title: "Log out",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
