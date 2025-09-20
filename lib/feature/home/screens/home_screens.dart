import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/core/conts/my_text_style.dart';
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

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isTablet = screenWidth > 600;

        return DefaultTabController(
          length: 4,
          child: Scaffold(
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: isTablet ? 40 : 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        const SizedBox(height: 16),
                        const ProgressCard(),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text("My Tasks", style: MyTextStyle.w5s20(context)),
                            const SizedBox(width: 15),
                            SizedBox(
                              height: 30,
                              width: isTablet ? 300 : null,
                              child: TabBar(
                                dividerColor: Colors.transparent,
                                tabAlignment: TabAlignment.start,
                                isScrollable: true,
                                indicator: const UnderlineTabIndicator(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 0,
                                  ),
                                ),
                                labelColor: AppColors.primaryColor,
                                unselectedLabelColor: Colors.grey,
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
                      ],
                    ),
                  ),
                ),
              ],
              body: TabBarView(
                children: List.generate(4, (index) => const HomeMeetingCard()),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: isTablet ? 40 : 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Quick actions", style: MyTextStyle.w5s20(context)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
