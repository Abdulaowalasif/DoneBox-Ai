import 'dart:io';
import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/conts/my_text_style.dart';
import '../controllers/edit_task_controller.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EditTaskController controller = Get.put(EditTaskController());

    return Scaffold(
      appBar: CustomAppbar(
        title: "Edit Task",
        onPress: () => Get.back(),
        trailing: Icons.save_outlined,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                    Text("Task Details", style: MyTextStyle.w5s20()),

                    /// Category
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Category"),
                        Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              borderRadius: BorderRadius.circular(10),
                              value: controller.category.value,
                              dropdownColor: AppColors.secondaryColor,
                              items: const [
                                DropdownMenuItem(
                                  value: "Work",
                                  child: Text("Work"),
                                ),
                                DropdownMenuItem(
                                  value: "Personal",
                                  child: Text("Personal"),
                                ),
                                DropdownMenuItem(
                                  value: "Shopping",
                                  child: Text("Shopping"),
                                ),
                              ],
                              onChanged: (val) {
                                if (val != null)
                                  controller.category.value = val;
                              },
                            ),
                          ),
                        ),
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

                    /// Notification
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Notification"),
                        Obx(
                          () => Switch(
                            value: controller.notification.value,
                            onChanged: (val) =>
                                controller.notification.value = val,
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
                        Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              borderRadius: BorderRadius.circular(10),
                              value: controller.reminder.value,
                              dropdownColor: AppColors.secondaryColor,
                              items: const [
                                DropdownMenuItem(
                                  value: "Daily",
                                  child: Text("Daily"),
                                ),
                                DropdownMenuItem(
                                  value: "Weekly",
                                  child: Text("Weekly"),
                                ),
                                DropdownMenuItem(
                                  value: "Monthly",
                                  child: Text("Monthly"),
                                ),
                              ],
                              onChanged: (val) {
                                if (val != null)
                                  controller.reminder.value = val;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// Priority
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Priority"),
                        Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              borderRadius: BorderRadius.circular(10),
                              value: controller.priority.value,
                              dropdownColor: AppColors.secondaryColor,
                              items: const [
                                DropdownMenuItem(
                                  value: "Low",
                                  child: Text("Low"),
                                ),
                                DropdownMenuItem(
                                  value: "Medium",
                                  child: Text("Medium"),
                                ),
                                DropdownMenuItem(
                                  value: "High",
                                  child: Text("High"),
                                ),
                              ],
                              onChanged: (val) {
                                if (val != null)
                                  controller.priority.value = val;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// Subtasks
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subtasks", style: MyTextStyle.w5s20()),
                  TextButton(
                    onPressed: () {
                      final TextEditingController subtaskController =
                          TextEditingController();
                      showDialog(
                        context: context,
                        builder: (ctx) => Dialog(
                          insetPadding: EdgeInsets.all(20),
                          // Remove default margins
                          child: Container(
                            width: MediaQuery.of(
                              context,
                            ).size.width, // Full screen width
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Add Subtask",
                                  style: MyTextStyle.w5s20().copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  controller: subtaskController,
                                  decoration: InputDecoration(
                                    hintStyle: MyTextStyle.w4s16(),
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
                                        style: MyTextStyle.w4s16(),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
                                      ),
                                      onPressed: () {
                                        if (subtaskController.text.isNotEmpty) {
                                          controller.addSubTask(
                                            subtaskController.text,
                                          );
                                        }
                                        Navigator.pop(ctx);
                                      },
                                      child: Text(
                                        "Add",
                                        style: MyTextStyle.w4s16().copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "+ Add SubTask",
                      style: MyTextStyle.w5s20().copyWith(
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
               Text(
                "Attachments",
                  style: MyTextStyle.w5s20()
              ),
              Obx(
                () => Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    /// Add File Button
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
                              style: MyTextStyle.w4s18().copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Added Files
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
                                    style: MyTextStyle.w4s18().copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
