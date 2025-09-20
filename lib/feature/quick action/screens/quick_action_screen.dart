import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/quick%20action/controllers/quick_action_controller.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/conts/my_text_style.dart';

class QuickActionScreen extends StatelessWidget {
  const QuickActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuickActionController controller = Get.find();
    return Scaffold(
      appBar: CustomAppbar(title: controller.title, onPress: () {}),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: controller.title == "Daily Recap"
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sunday,May 25",
                            style: MyTextStyle.w5s20(
                              context,
                            ).copyWith(color: AppColors.primaryColor),
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green,
                                ),
                                child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                              Text(
                                "Work on proposal",
                                style: MyTextStyle.w5s16(context),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green,
                                ),
                                child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                              Text(
                                "Client Feedback",
                                style: MyTextStyle.w5s16(context),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green,
                                ),
                                child: Icon(
                                  Icons.done,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                              Text(
                                "Outline Presentation",
                                style: MyTextStyle.w5s16(context),
                              ),
                            ],
                          ),
                          Text(
                            "See More",
                            style: MyTextStyle.w5s20(
                              context,
                            ).copyWith(color: AppColors.primaryColor),
                          ),
                          Container(color: AppColors.primaryColor, height: 1),
                          const SizedBox(height: 10),
                          Column(
                            spacing: 10,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Overall Progress",
                                    style: MyTextStyle.w5s20(
                                      context,
                                    ).copyWith(color: AppColors.primaryColor),
                                  ),
                                  Text(
                                    "50%",
                                    style: MyTextStyle.w5s20(
                                      context,
                                    ).copyWith(color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                              LinearProgressIndicator(
                                color: AppColors.primaryColor,
                                value: 0.5,
                                backgroundColor: Colors.grey.shade50,
                                minHeight: 10,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("Insights", style: MyTextStyle.w5s20(context)),
                    Text(
                      "You completed 80% of your planned tasks today. Great job staying focused!",
                      style: MyTextStyle.w5s14(context),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Upcoming Tasks",
                          style: MyTextStyle.w5s20(context),
                        ),
                        Text("Monday", style: MyTextStyle.w5s16(context)),
                      ],
                    ),
                    const SizedBox(height: 20),
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
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              "Call Sarah",
                              style: MyTextStyle.w4s16(context),
                            ),
                          ],
                        ),
                        Text("10:00 AM", style: MyTextStyle.w5s20(context)),
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
                              "go to the gym",
                              style: MyTextStyle.w4s16(context),
                            ),
                          ],
                        ),
                        Text("10:00 AM", style: MyTextStyle.w5s20(context)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: "Share Recap",
                      onPressed: () {
                        Share.share("Share your experience...");
                      },
                      width: double.infinity,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () => Get.back(),
                        child: Text(
                          "Close",
                          style: MyTextStyle.w5s18(
                            context,
                          ).copyWith(color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Text", style: MyTextStyle.w5s20(context)),
                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Enter text",
                      hintStyle: MyTextStyle.w4s16(context),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: controller.title,
                    onPressed: () {
                      Get.back();
                    },
                    width: double.infinity,
                  ),
                  const SizedBox(height: 20),
                  Text(controller.title, style: MyTextStyle.w5s20(context)),
                  TextField(
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: "Enter text",
                      hintStyle: MyTextStyle.w4s16(context),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
