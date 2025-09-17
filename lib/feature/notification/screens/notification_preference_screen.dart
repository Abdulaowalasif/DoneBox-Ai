import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/notification/controllers/notification_pref_controller.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conts/my_text_style.dart';

class NotificationPreferenceScreen extends StatelessWidget {
  const NotificationPreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationPrefController controller = Get.find();

    return Scaffold(
      appBar: CustomAppbar(title: "Notification Preference", onPress: () {}),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.secondaryColor,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Text Section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Task Reminder", style: MyTextStyle.w5s18()),
                        SizedBox(height: 6),
                        Text(
                          "Get notified when it's time to work on a task.",
                          style: MyTextStyle.w4s12(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  /// Toggle Switch
                  Obx(
                    () => Switch(
                      value: controller.isActive.value,
                      thumbColor: WidgetStatePropertyAll(Colors.white),
                      onChanged: (value) {
                        controller.isActive.value = !controller.isActive.value;
                      },
                      activeColor: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text("Advanced Settings", style: MyTextStyle.w5s20()),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Silent Hours", style: MyTextStyle.w5s20()),
                GestureDetector(
                  onTap: () => controller.pickSilentHours(context),
                  child: Obx(
                    () => Text(
                      controller.silentHours,
                      style: MyTextStyle.w5s16().copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            CustomButton(
              text: "Save Changes",
              onPressed: () {
                Get.back();
              },
              width: double.infinity,
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  "Cancel",
                  style: MyTextStyle.w5s18().copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
