import 'package:doneboxai/feature/quick%20action/controllers/quick_action_controller.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/conts/app_colors.dart';
import '../../../core/conts/image_icon_const.dart';
import '../../../routes/routes_names.dart';
import '../../widgets/action_card.dart';

class HubScreen extends StatelessWidget {
  const HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuickActionController controller = Get.find();

    return Scaffold(
      appBar: CustomAppbar(title: "Hub", onPress: () {}),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionCard(
                  image: ImageConst.summerize,
                  title: "Summerize",
                  color: AppColors.secondaryColor,
                  onPress: () {
                    controller.title = "Summerize";
                    Get.toNamed(RoutesName.quickAction);
                  },
                ),
                ActionCard(
                  image: ImageConst.reply,
                  title: "Reply",
                  color: AppColors.cardColor,
                  onPress: () {
                    controller.title = "Reply";
                    Get.toNamed(RoutesName.quickAction);
                  },
                ),
                ActionCard(
                  image: ImageConst.explain,
                  title: "Explain",
                  color: AppColors.cardColor2,
                  onPress: () {
                    controller.title = "Explain";
                    Get.toNamed(RoutesName.quickAction);
                  },
                ),
                ActionCard(
                  image: ImageConst.dailyRecap,
                  title: "Daily Recap",
                  color: AppColors.secondaryColor,
                  onPress: () {
                    controller.title = "Daily Recap";
                    Get.toNamed(RoutesName.quickAction);
                  },
                ),
              ],
            ),

            Text(
              "Active projects",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      "Website Redesign",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        SizedBox(
                          width: 200,
                          child: LinearProgressIndicator(
                            backgroundColor: AppColors.secondaryColor,
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                            minHeight: 10,
                            value: 0.7,
                          ),
                        ),
                        Text("70%"),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      "Team Onboarding",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        SizedBox(
                          width: 200,
                          child: LinearProgressIndicator(
                            backgroundColor: AppColors.secondaryColor,
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                            minHeight: 10,
                            value: 0.2,
                          ),
                        ),
                        Text("20%"),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Text(
              "Today’s highligts",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueAccent,
                      ),
                    ),
                    Text(
                      "Weekly review",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  "9:00 AM",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "Team meeting",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  "10:00 AM",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionCard(
                  image: ImageConst.newNote,
                  title: "Notes",
                  color: AppColors.cardColor,
                  onPress: () {},
                ),
                ActionCard(
                  image: ImageConst.newNote,
                  title: "Focus Mode",
                  color: AppColors.cardColor,
                  onPress: () {
                    Get.toNamed(RoutesName.focusMode);
                  },
                ),
                ActionCard(
                  image: ImageConst.newNote,
                  title: "Recent File",
                  color: AppColors.cardColor,
                  onPress: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
