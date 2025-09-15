import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/home/controllers/ai_task_create_controller.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiTaskCreateScreen extends StatelessWidget {
  const AiTaskCreateScreen({super.key});

  Future<void> _pickFile(AiTaskCreateController controller) async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      controller.attachFile(result.files.single.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AiTaskCreateController controller = Get.find();

    return Scaffold(
      appBar: CustomAppbar(title: "AI Task Creator", onPress: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 20,
            children: [
              // Task input
              TextField(
                decoration: InputDecoration(
                  hintText: "Describe your task...",
                  suffixIcon: const Icon(CupertinoIcons.mic),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onChanged: (value) => controller.taskTitle.value = value,
              ),

              // Dynamic Task Container
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.secondaryColor,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.taskTitle.value,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        controller.taskDescription.value,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      // Category Section
                      const Text(
                        "Category",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: controller.categories.map((cat) {
                          final isSelected =
                              controller.selectedCategory.value == cat;
                          return GestureDetector(
                            onTap: () => controller.setCategory(cat),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primaryColor
                                    : AppColors.secondaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                cat,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      // Due Date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Due date",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            controller.dueDate.value,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      // Time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Time",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            controller.time.value,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      // Notification Switch
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Notification",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Obx(
                            () => Switch(
                              value: controller.isNotificationOn.value,
                              onChanged: (value) =>
                                  controller.isNotificationOn.value = value,
                              thumbColor: const WidgetStatePropertyAll(
                                Colors.white,
                              ),
                              activeColor: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),

                      // Reminder
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Reminder",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Obx(
                            () => DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                borderRadius: BorderRadius.circular(10),
                                dropdownColor: AppColors.secondaryColor,
                                value: controller.reminder.value,
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                ),
                                items: [
                                  DropdownMenuItem(
                                    value: "Daily",
                                    child: Text("Daily"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Weekly",
                                    child: Text("Weekly"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Never",
                                    child: Text("Never"),
                                  ),
                                ],
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.setReminder(value.toString());
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Priority
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Priority",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Obx(
                            () => DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                borderRadius: BorderRadius.circular(10),
                                dropdownColor: AppColors.secondaryColor,
                                value: controller.priority.value,
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                ),
                                items: [
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
                                onChanged: (value) {
                                  if (value != null) {
                                    controller.setPriority(value.toString());
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      Divider(color: AppColors.secondaryColor),

                      // File Attachment
                      Row(
                        children: [
                          const Icon(Icons.attach_file),
                          Obx(
                            () => TextButton(
                              onPressed: () => _pickFile(controller),
                              child: Text(
                                controller.attachedFile.value.isEmpty
                                    ? "Attach File"
                                    : controller.attachedFile.value,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Save Button
              CustomButton(
                text: "Save",
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
