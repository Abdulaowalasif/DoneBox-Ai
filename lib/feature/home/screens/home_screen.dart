import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/core/conts/navIds.dart';
import 'package:doneboxai/feature/home/controller/action_controller.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/action_card.dart';
import '../../widgets/custom_home_appbar.dart';
import '../../widgets/date_card.dart';
import '../../widgets/home_item_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ActionController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomHomeAppBar(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChooseItem(),
                  const SizedBox(height: 15),
                  DateCard(),
                ],
              ),
            ),
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.buttonColor),
              child: Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick actions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ActionCard(
                          image: ImageConst.summerize,
                          title: "Summerize",
                          color: Color(0xFFCBE4FD),
                          onPress: () {
                            controller.action = "Summerize";
                            Get.toNamed(RoutesName.actions, id: NavIds.home);
                          },
                        ),
                        ActionCard(
                          image: ImageConst.reply,
                          title: "Reply",
                          color: Color(0xFFCEECEB),
                          onPress: () {
                            controller.action = "Reply";
                            Get.toNamed(RoutesName.actions, id: NavIds.home);
                          },
                        ),
                        ActionCard(
                          image: ImageConst.explain,
                          title: "Explain",
                          color: Color(0xFFDCDDF7),
                          onPress: () {
                            controller.action = "Explain";
                            Get.toNamed(RoutesName.actions, id: NavIds.home);
                          },
                        ),
                        ActionCard(
                          image: ImageConst.dailyRecap,
                          title: "Daily Recap",
                          color: Color(0xFFC3E2FF),
                          onPress: () {
                            controller.action = "Daily Recap";
                            Get.toNamed(RoutesName.actions, id: NavIds.home);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
