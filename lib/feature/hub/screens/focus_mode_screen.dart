import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/hub/controllers/focus_mode_controller.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/conts/my_text_style.dart';

class FocusModeScreen extends StatelessWidget {
  const FocusModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusModeController controller = Get.find();

    return Scaffold(
      appBar: CustomAppbar(title: "Focus Mode", onPress: () {}),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              spacing: 10,
              children: [
                Obx(
                  () => Text(
                    controller.timer.value.toString(),
                    style: MyTextStyle.w6s30(context),
                  ),
                ),
                Obx(
                  () => CustomButton(
                    text: controller.isRunning.value ? "Pause" : "Start",
                    onPressed: controller.toggleFocusSession,
                    width: 150,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Session Settings", style: MyTextStyle.w5s16(context)),
                      Obx(
                        () => Text(
                          controller.sessionDescription.value,
                          style: MyTextStyle.w4s16(context),
                        ),
                      ),
                      Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.watch_later_outlined),
                              Text("Duration", style: MyTextStyle.w5s16(context)),
                            ],
                          ),

                          Obx(
                                () => Flexible(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                  spacing: 10,
                                  children: controller.durations.map((d) {
                                    return GestureDetector(
                                      onTap: () async {
                                        if (d == "Custom") {
                                          await controller.pickCustomDuration(context);
                                        } else {
                                          controller.selectDuration(d);
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: controller.selectedDuration.value == d
                                              ? AppColors.primaryColor
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                            color: controller.selectedDuration.value == d
                                                ? AppColors.primaryColor
                                                : Colors.grey.shade400,
                                          ),
                                        ),
                                        child: Text(
                                          d,
                                          style: GoogleFonts.poppins(
                                            color: controller.selectedDuration.value == d
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),



                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.watch_later_outlined),
                              Text("Breaks", style: MyTextStyle.w5s16(context)),
                            ],
                          ),
                          Obx(
                            () => Text(
                              controller.selectedBreak.value,
                              style: MyTextStyle.w5s16(context),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.alarm),
                              Text("Sounds", style: MyTextStyle.w5s16(context)),
                            ],
                          ),
                          Obx(
                            () => TextButton(
                              onPressed: () => controller.changeSound(),
                              child: Row(
                                children: [
                                  Text(
                                    controller.selectedSound.value,
                                    style: MyTextStyle.w5s16(context).copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Linked task",
                            style: MyTextStyle.w5s16(context).copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          TextButton(
                            child: Text("Change", style: MyTextStyle.w5s16(context)),
                            onPressed: () => controller.changeLinkedTask(),
                          ),
                        ],
                      ),
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              spacing: 10,
                              children: [
                                const Icon(CupertinoIcons.text_alignleft),
                                Text(
                                  controller.linkedTask.value,
                                  style: MyTextStyle.w5s16(context),
                                ),
                              ],
                            ),
                            Text(
                              controller.linkedTaskCategory.value,
                              style: MyTextStyle.w5s16(context),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    child: LinearProgressIndicator(
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                      value: controller.progress.value,
                      color: AppColors.primaryColor,
                      backgroundColor: AppColors.secondaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Obx(
                    () => Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.sessionMessage.value,

                          style: MyTextStyle.w5s16(context),
                        ),
                        Text(
                          "${controller.completedSessions.value} focus sessions completed.",

                          style: MyTextStyle.w5s16(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
