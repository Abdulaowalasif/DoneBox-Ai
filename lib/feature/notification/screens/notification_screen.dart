import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/conts/my_text_style.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Notification",
        trailing: Icons.tune,
        onPress: () {
          Get.toNamed(RoutesName.notificationPref);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 10,
          children: [
            for (int i = 0; i < 5; i++)
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.secondaryColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Icon
                    Image.asset(ImageConst.hourGlass, height: 40, width: 40),
                    const SizedBox(width: 12),

                    /// Text Section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Task Deadline Reminder",
                            style: MyTextStyle.w5s18(context),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Your task ‘Submit Project Proposal’ is due tomorrow at 10:00 AM.",
                            style: MyTextStyle.w4s12(context),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),

                    /// Time
                    const SizedBox(width: 8),
                    Text(
                      "1 min ago",
                      style:  MyTextStyle.w4s12(context)
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
