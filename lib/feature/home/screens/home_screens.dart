import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/feature/widgets/action_card.dart';
import 'package:doneboxai/feature/widgets/app_icon.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../quick action/controllers/quick_action_controller.dart';
import '../widgets/home_meeting_card.dart';
import '../widgets/progress_card.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuickActionController());

    return DefaultTabController(
      length: 4, // number of tabs
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // app icon section
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppIcon(),
                      IconButton(
                        onPressed: () {
                          Get.toNamed(RoutesName.notification);
                        },
                        icon: const Icon(CupertinoIcons.bell),
                      ),
                    ],
                  ),
                ),

                // progress bar
                const ProgressCard(),

                const SizedBox(height: 20),

                // "My Tasks" + TabBar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "My Tasks",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 200,
                      height: 30,
                      child: TabBar(
                        tabAlignment: TabAlignment.start,
                        indicatorColor: AppColors.primaryColor,
                        labelColor: AppColors.primaryColor,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,
                        indicator: const BoxDecoration(),
                        tabs: const [
                          Tab(text: "All"),
                          Tab(text: "Personal"),
                          Tab(text: "Work"),
                          Tab(text: "Others"),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                SizedBox(
                  height: 400,
                  child: TabBarView(
                    children: [
                      HomeMeetingCard(),
                      HomeMeetingCard(),
                      HomeMeetingCard(),
                      HomeMeetingCard(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Quick actions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
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
                      color: AppColors.secondaryColor,
                      onPress: () {
                        controller.title = "Reply";
                        Get.toNamed(RoutesName.quickAction);
                      },
                    ),
                    ActionCard(
                      image: ImageConst.explain,
                      title: "Explain",
                      color: AppColors.secondaryColor,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
