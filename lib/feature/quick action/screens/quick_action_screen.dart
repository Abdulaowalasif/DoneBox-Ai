import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart'; // ✅ add this line

import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/core/conts/my_text_style.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/quick%20action/controllers/quick_action_controller.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QuickActionScreen extends StatelessWidget {
  QuickActionScreen({super.key});

  final GlobalKey _recapKey = GlobalKey(); // ✅ used for screenshot capture

  @override
  Widget build(BuildContext context) {
    final QuickActionController controller = Get.find();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppbar(
        title: controller.title,
        onPress: () {},
        onBackPress: () {
          controller.textController.clear();
          controller.responseController.value = ""; // clear response
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: controller.title == "Daily Recap"
            ? _buildDailyRecap(context)
            : _buildActionUI(context, controller),
      ),
    );
  }

  /// ✅ Build Daily Recap Section with RepaintBoundary
  Widget _buildDailyRecap(BuildContext context) {
    // Screenshot controller for capturing the recap
    final ScreenshotController _screenshotController = ScreenshotController();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ✅ Screenshot wrapper
          Screenshot(
            controller: _screenshotController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.primaryColor, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sunday, May 25",
                        style: MyTextStyle.w5s20(
                          context,
                        ).copyWith(color: AppColors.primaryColor),
                      ),
                      const SizedBox(height: 10),
                      _taskItem(context, "Work on proposal"),
                      _taskItem(context, "Client Feedback"),
                      _taskItem(context, "Outline Presentation"),
                      Text(
                        "See More",
                        style: MyTextStyle.w5s20(
                          context,
                        ).copyWith(color: AppColors.primaryColor),
                      ),
                      Container(color: AppColors.primaryColor, height: 1),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      const SizedBox(height: 10),
                      LinearProgressIndicator(
                        color: AppColors.primaryColor,
                        value: 0.5,
                        backgroundColor: Colors.grey.shade50,
                        minHeight: 10,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      _upcomingTask(
                        context,
                        "Call Sarah",
                        "10:00 AM",
                        Colors.red,
                      ),
                      _upcomingTask(
                        context,
                        "Go to the gym",
                        "10:00 AM",
                        Colors.green,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          /// ✅ Share Button
          CustomButton(
            text: "Share Recap",
            onPressed: () async {
              try {
                final imageBytes = await _screenshotController.capture(
                  pixelRatio: 3.0,
                );

                if (imageBytes == null) return;

                final directory = await getTemporaryDirectory();
                final imagePath = File('${directory.path}/recap.png');
                await imagePath.writeAsBytes(imageBytes);

                await Share.shareXFiles([
                  XFile(imagePath.path),
                ], text: "Here’s my daily recap!");
              } catch (e) {
                Get.snackbar(
                  "Error",
                  "Failed to capture recap.",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
            },
            width: double.infinity,
          ),

          /// ✅ Close Button
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
    );
  }

  /// Action UI for other quick actions
  Widget _buildActionUI(
    BuildContext context,
    QuickActionController controller,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Text", style: MyTextStyle.w5s20(context)),
          TextField(
            controller: controller.textController,
            maxLines: null,
            decoration: InputDecoration(
              hintText: "Enter text",
              hintStyle: MyTextStyle.w4s16(context),
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => CustomButton(
              isLoading: controller.isLoading.value,
              text: controller.title,
              onPressed: () {
                if (controller.title == "Summerize") {
                  controller.getSummery();
                } else if (controller.title == "Reply") {
                  controller.getReply();
                } else if (controller.title == "Explain") {
                  controller.getExplain();
                }
              },
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(controller.title, style: MyTextStyle.w5s20(context)),
              IconButton(
                onPressed: () {
                  if (controller.responseController.value.isNotEmpty) {
                    Clipboard.setData(
                      ClipboardData(text: controller.responseController.value),
                    );
                    Get.snackbar(
                      "Copied",
                      "Copied to clipboard!",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppColors.primaryColor,
                      colorText: Colors.white,
                    );
                  }
                },
                icon: Icon(Icons.copy, color: AppColors.primaryColor),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CopyableResponseField(response: controller.responseController),
        ],
      ),
    );
  }

  /// Task item widget
  Widget _taskItem(BuildContext context, String title) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green,
          ),
          child: const Icon(Icons.done, color: Colors.white, size: 16),
        ),
        const SizedBox(width: 10),
        Text(title, style: MyTextStyle.w5s16(context)),
      ],
    );
  }

  /// Upcoming task widget
  Widget _upcomingTask(
    BuildContext context,
    String title,
    String time,
    Color color,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color,
              ),
            ),
            const SizedBox(width: 10),
            Text(title, style: MyTextStyle.w4s16(context)),
          ],
        ),
        Text(time, style: MyTextStyle.w5s20(context)),
      ],
    );
  }
}

class CopyableResponseField extends StatelessWidget {
  final RxString response;

  const CopyableResponseField({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return Obx(() {
      final text = response.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SelectableText(
              text.isEmpty ? "No response yet..." : text,
              style: MyTextStyle.w4s16(context).copyWith(
                fontSize: isSmallScreen ? 13 : 16,
                color: text.isEmpty ? Colors.grey.shade500 : Colors.black87,
              ),
            ),
          ),
        ],
      );
    });
  }
}
