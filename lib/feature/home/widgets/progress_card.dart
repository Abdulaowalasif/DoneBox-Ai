import 'package:doneboxai/feature/home/controllers/home_controller.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/conts/image_icon_const.dart';
import '../../../core/conts/my_text_style.dart';

class ProgressCard extends StatelessWidget {
  final HomeController controller;

  const ProgressCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Responsive scaling factors
    final isSmallScreen = screenWidth < 360;
    final isTablet = screenWidth >= 600;

    final cardHeight = screenHeight * (isTablet ? 0.22 : 0.25);
    final avatarSize = screenWidth * (isTablet ? 0.07 : 0.10);
    final avatarSpacing = avatarSize * 0.6;
    final padding = screenWidth * 0.04;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: screenHeight * 0.01),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF46B8EA),
            Color(0xFF30A3E4),
            Color(0xFF1378D4),
            Color(0xFF085CBE),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Greeting Text
              Text(
                "Good Morning, Hakim",
                style: MyTextStyle.w4s16(context).copyWith(
                  fontSize: isSmallScreen
                      ? 13
                      : isTablet
                      ? 18
                      : 16,
                  color: Colors.white,
                ),
              ),

              /// Title
              Text(
                "Today’s progress summary",
                style: MyTextStyle.w7s20(context).copyWith(
                  fontSize: isSmallScreen
                      ? 16
                      : isTablet
                      ? 22
                      : 20,
                  color: Colors.white,
                ),
              ),

              /// Task Count
              Obx(
                () => Text(
                  "${controller.todayProgress['total_tsk_count']} Tasks",
                  style: MyTextStyle.w4s16(context).copyWith(
                    fontSize: isSmallScreen ? 13 : 16,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.005),

              /// Avatar Row + Progress Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Avatars
                  Flexible(
                    flex: 2,
                    child: SizedBox(
                      height: avatarSize,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          for (int i = 0; i < 3; i++)
                            Positioned(
                              left: i * avatarSpacing,
                              child: Image.asset(
                                ImageConst.user,
                                height: avatarSize,
                                width: avatarSize,
                                fit: BoxFit.cover,
                              ),
                            ),
                          Positioned(
                            left: 3 * avatarSpacing,
                            child: GestureDetector(
                              onTap: () =>
                                  Get.toNamed(RoutesName.createNewTask),
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: screenWidth * 0.04),

                  /// Progress Details
                  Flexible(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Progress",
                              style: MyTextStyle.w5s20(context).copyWith(
                                fontSize: isSmallScreen ? 14 : 18,
                                color: Colors.white,
                              ),
                            ),
                            Obx(
                              () => Text(
                                "${controller.todayProgress['percentage_completed']}%",
                                style: MyTextStyle.w5s18(context).copyWith(
                                  fontSize: isSmallScreen ? 13 : 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.008),

                        Obx(() {
                          final progress =
                              (controller.todayProgress['percentage_completed'] ??
                                      0)
                                  .toDouble() /
                              100;
                          return LinearProgressIndicator(
                            minHeight: isSmallScreen ? 8 : 10,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            value: progress.clamp(0.0, 1.0),
                            color: const Color(0xFF9397EF),
                            backgroundColor: Colors.white,
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
