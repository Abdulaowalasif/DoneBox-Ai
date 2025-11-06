import 'dart:io';

import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/tasks/controllers/create_new_task_controller.dart';
import 'package:doneboxai/feature/widgets/category_dropdown.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:doneboxai/feature/widgets/reminder_dropdown.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conts/my_text_style.dart';
import '../../home/screens/edit_task_screen.dart';
import '../../widgets/priority_dropdown.dart';

class CreateNewTaskScreen extends StatelessWidget {
  const CreateNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateNewTaskController controller = Get.find();

    return Scaffold(
      appBar: CustomAppbar(
        title: "Create New Task",
        trailing: Icons.save_outlined,
        onPress: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              /// Task Details
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primaryColor),
                  color: AppColors.secondaryColor,
                ),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Task Details", style: MyTextStyle.w5s20(context)),

                    /// Category
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Category"),
                        CategoryDropdown(selectedCategory: controller.category),
                      ],
                    ),

                    /// Due Date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Due Date"),
                        Obx(
                          () => GestureDetector(
                            onTap: () async {
                              final picked = await showDatePicker(
                                barrierDismissible: true,
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null) {
                                controller.dueDate.value =
                                    "${picked.day}/${picked.month}/${picked.year}";
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(controller.dueDate.value),
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// Time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Time"),
                        Obx(
                          () => GestureDetector(
                            onTap: () async {
                              final picked = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: AppColors.primaryColor, // Header background color
                                        onPrimary: Colors.white, // Header text color
                                        secondary: AppColors.primaryColor, // AM/PM selected background color
                                        onSecondary: Colors.white, // AM/PM selected text color
                                        onSurface: Colors.black, // Picker text color
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if (picked != null) {
                                controller.time.value = picked.format(context);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(controller.time.value),
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// Notification Switch
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Notification"),
                        Obx(
                          () => Switch(
                            value: controller.notification.value,
                            onChanged: (value) =>
                                controller.notification.value = value,
                            activeColor: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),

                    /// Reminder
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Reminder"),
                        ReminderDropdown(selectedReminder: controller.reminder),
                      ],
                    ),

                    /// Priority
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Priority"),
                        PriorityDropdown(selectedPriority: controller.priority),
                      ],
                    ),
                  ],
                ),
              ),

              /// Subtasks Section
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
                                    style: MyTextStyle.w5s20(
                                      context,
                                    ).copyWith(color: AppColors.primaryColor),
                                  ),
                                  const SizedBox(height: 20),
                                  TextField(
                                    controller: subtaskController,
                                    decoration: const InputDecoration(
                                      hintText: "Enter subtask",
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
                                          style: MyTextStyle.w4s18(context),
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
                      style: MyTextStyle.w5s20(
                        context,
                      ).copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),

              /// Subtask List
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
              /// Attachments
              Text("Attachments", style: MyTextStyle.w5s20(context)),

              /// Files row
              Obx(
                () => Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    /// Add New File button
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
                              style: MyTextStyle.w4s18(
                                context,
                              ).copyWith(color: AppColors.primaryColor),
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
                                    style: MyTextStyle.w4s18(
                                      context,
                                    ).copyWith(color: AppColors.primaryColor),
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
            ],
          ),
        ),
      ),
    );
  }
}
