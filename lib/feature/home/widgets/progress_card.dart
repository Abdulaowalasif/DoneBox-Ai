import 'package:flutter/material.dart';
import '../../../core/conts/image_icon_const.dart';
import '../../../core/conts/my_text_style.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final cardHeight = screenHeight * 0.25;
    final avatarSize = screenWidth * 0.12; // responsive avatar size
    final avatarSpacing = avatarSize * 0.6;

    return Container(
      height: cardHeight,
      width: double.infinity,
      margin: EdgeInsets.only(top: screenHeight * 0.01),
      padding: EdgeInsets.all(screenWidth * 0.04),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning, Hakim",
            style: MyTextStyle.w4s16(context).copyWith(color: Colors.white),
          ),
          Text(
            "Today’s progress summary",
            style: MyTextStyle.w7s20(context).copyWith(color: Colors.white),
          ),
          Text(
            "5 Tasks",
            style: MyTextStyle.w4s16(context).copyWith(color: Colors.white),
          ),
          Row(
            children: [
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
                        child: Image.asset(
                          ImageConst.addUser,
                          height: avatarSize,
                          width: avatarSize,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
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
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "40%",
                          style: MyTextStyle.w5s18(context).copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const LinearProgressIndicator(
                      minHeight: 10,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      value: 0.4,
                      color: Color(0xFF9397EF),
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
