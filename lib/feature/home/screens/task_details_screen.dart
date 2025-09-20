import 'dart:io';

import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/home/controllers/task_details_controller.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conts/app_colors.dart';
import '../../../core/conts/my_text_style.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskDetailsController controller = Get.find();
    return Scaffold(
      appBar: CustomAppbar(
        title: "Meetings",
        onPress: () {
          Get.toNamed(RoutesName.editTask);
        },
        trailing: Icons.edit_outlined,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primaryColor, width: 1),
                  color: AppColors.secondaryColor,
                ),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Task Details", style: MyTextStyle.w5s20(context)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text("Category"), const Text("Work")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Due Date"), Text("15 August")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Time"), Text("7:00 AM")],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Notification"),
                        Obx(
                          () => Switch(
                            value: controller.activeNotification.value,
                            onChanged: (val) {
                              controller.activeNotification.value =
                                  !controller.activeNotification.value;
                            },
                            activeTrackColor: AppColors.primaryColor,
                            inactiveThumbColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Reminder"), Text("Weekly")],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subtasks", style: MyTextStyle.w5s20(context)),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) {
                          final TextEditingController subtaskController =
                              TextEditingController();
                          return Dialog(
                            insetPadding: EdgeInsets.all(20),
                            // removes default margin
                            child: Container(
                              width: MediaQuery.of(
                                context,
                              ).size.width, // full screen width
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Add Subtask",
                                    style: MyTextStyle.w5s20(ctx).copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  TextField(
                                    controller: subtaskController,
                                    decoration: InputDecoration(
                                      hintText: "Enter subtask",
                                      hintStyle: MyTextStyle.w4s16(context),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(ctx),
                                        child: Text(
                                          "Cancel",
                                          style: MyTextStyle.w4s16(ctx),
                                        ),
                                      ),
                                      CustomButton(
                                        text: "Add",
                                        onPressed: () {
                                          if (subtaskController
                                              .text
                                              .isNotEmpty) {
                                            controller.addSubTask(
                                              subtaskController.text,
                                            );
                                          }
                                          Navigator.pop(ctx);
                                        },
                                        width: 100,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      "+ Add SubTask",
                      style: MyTextStyle.w5s20(context).copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.subTasks.length,
                  itemBuilder: (context, index) {
                    final subTask = controller.subTasks[index];
                    return ListTile(
                      leading: Checkbox(
                        value: subTask["done"],
                        onChanged: (val) =>
                            controller.toggleSubTask(index, val ?? false),
                        activeColor: AppColors.primaryColor,
                      ),
                      title: Text(subTask["title"]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => controller.removeSubTask(index),
                      ),
                    );
                  },
                ),
              ),

              /// Attachments
              Text("Attachments", style: MyTextStyle.w5s20(context)),

              Obx(
                () => Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    /// Add New File Button
                    InkWell(
                      onTap: () async {
                        final result = await FilePicker.platform.pickFiles();
                        if (result != null &&
                            result.files.single.path != null) {
                          controller.addAttachment(
                            File(result.files.single.path!),
                          );
                        }
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: AppColors.primaryColor,
                              size: 30,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Add File",
                              style: MyTextStyle.w4s18(context).copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Added files
                    ...controller.attachments.asMap().entries.map((entry) {
                      final index = entry.key;
                      final file = entry.value;

                      return Container(
                        width: 120,
                        height: 120,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.insert_drive_file,
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    file.path.split('/').last,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),

                            /// Delete button
                            Positioned(
                              top: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () => controller.removeAttachment(index),
                                child: const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.close,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),

              CustomButton(
                text: "Mark as Completed",
                onPressed: () {
                  Get.back();
                },
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
