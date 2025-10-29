import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/core/conts/my_text_style.dart';
import 'package:doneboxai/feature/home/controllers/home_controller.dart';
import 'package:doneboxai/feature/home/controllers/task_details_controller.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/conts/app_colors.dart';

class HomeMeetingCard extends StatelessWidget {
  final TaskDetailsController detailsController;

  const HomeMeetingCard({super.key, required this.detailsController});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Obx(
      () => SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < controller.tasks.length; i++)
              GestureDetector(
                onTap: () {
                  detailsController.fetchTaskDetails(controller.tasks[i]['id']);
                  Get.toNamed(RoutesName.taskDetails);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    style: ListTileStyle.drawer,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: AppColors.primaryColor,
                              child: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: Colors.white,
                              ),
                            ),
                            Obx(
                              () => Text(
                                controller.tasks[i]['title'] ?? 'Task Details',
                                style: MyTextStyle.w5s18(context),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),

                        Obx(() {
                          String? dateTime = controller.tasks[i]['ends_at'];

                          // Handle null safely
                          if (dateTime == null || !dateTime.contains('T')) {
                            return Text(
                              "00:00 AM",
                              style: MyTextStyle.w5s14(context),
                            );
                          }

                          // Extract time part
                          String time = dateTime
                              .split('T')[1]
                              .replaceAll('Z', '');

                          return Text(time, style: MyTextStyle.w5s14(context));
                        }),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsGeometry.all(10),
                          child: Row(
                            spacing: 10,
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF72B34A),
                                ),
                              ),
                              Obx(
                                () => Text(
                                  controller.tasks[i]['category']['title'] ??
                                      "Work",
                                  style: MyTextStyle.w5s14(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(
                          () => Text(
                            controller.tasks[i]['priority'] ?? "High",
                            style: MyTextStyle.w5s14(
                              context,
                            ).copyWith(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                onPressed: () {
                  Get.toNamed(RoutesName.aiTaskCreate);
                },
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageConst.aiIcon, height: 40),
                    Text(
                      "Task Create with ai",
                      style: MyTextStyle.w4s16(
                        context,
                      ).copyWith(color: Colors.white),
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
