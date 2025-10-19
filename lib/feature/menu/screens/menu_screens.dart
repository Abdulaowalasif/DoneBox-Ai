import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/feature/menu/controllers/main_menu_controller.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              // user profile header section
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 30,
                  backgroundImage: AssetImage(ImageConst.user),
                ),
                title: Text(
                  "Chester Bennington",
                  style: MyTextStyle.w5s16(context).copyWith(fontSize: 15),
                ),
                subtitle: Text(
                  "Chester@gmail.com",
                  style: MyTextStyle.w4s12(context).copyWith(fontSize: 13),
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

              // productivity tools section
              Text("Productivity Tools", style: MyTextStyle.w5s20(context)),
              Column(
                spacing: 5,
                children: [
                  SettingsItem(
                    icon: Iconsax.note_2,
                    title: "Notes",
                    onPress: () => Get.toNamed(RoutesName.notes),
                  ),
                  SettingsItem(
                    onPress: () => Get.toNamed(RoutesName.insight),
                    icon: Iconsax.activity,
                    title: "Insights",
                  ),
                ],
              ),

              // settings and profile section
              Text("Settings & Profile", style: MyTextStyle.w5s20(context)),
              Column(
                spacing: 5,
                children: [
                  Obx(
                    () => SettingsItem(
                      isActive: controller.pauseNotification.value,
                      icon: Iconsax.notification,
                      title: "Pause Notification",
                      showToggle: true,
                      toggleChanged: () => controller.pauseNotification.value =
                          !controller.pauseNotification.value,
                    ),
                  ),
                  SettingsItem(
                    onPress: () => Get.toNamed(RoutesName.notificationPref),
                    icon: Iconsax.notification_favorite,
                    title: "Notification Preferences",
                  ),
                  SettingsItem(
                    onPress: () => Get.toNamed(RoutesName.subscription),
                    icon: Iconsax.crown,
                    title: "Subscription Tier",
                  ),
                  SettingsItem(
                    onPress: () => Get.toNamed(RoutesName.profile),
                    icon: Iconsax.setting,
                    title: "Account Settings",
                  ),
                  SettingsItem(
                    onPress: () => Get.toNamed(RoutesName.helpAndSupport),
                    icon: Iconsax.message_question,
                    title: "Help & Support",
                  ),
                  SettingsItem(
                    onPress: () => Get.toNamed(RoutesName.privacyPolicy),
                    icon: Iconsax.unlock,
                    title: "Privacy & Policy",
                  ),
                  SettingsItem(
                    onPress: () => controller.logout(),
                    icon: Iconsax.logout,
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
