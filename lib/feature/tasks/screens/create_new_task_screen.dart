import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewTaskScreen extends StatelessWidget {
  const CreateNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    Text(
                      "Task Details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Category"),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 1,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: AppColors.secondaryColor,
                              value: "Work",
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                size: 14,
                              ),
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
                              onChanged: (value) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Due Date"),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 1,
                            ),
                          ),
                          child: Text("15 August"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Time"),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 1,
                            ),
                          ),
                          child: Text("7:00 AM"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Notification"),
                        Switch(
                          value: true,
                          thumbColor: WidgetStatePropertyAll(Colors.white),
                          onChanged: (value) {},
                          activeColor: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Reminder"),
                        Row(
                          children: [
                            Text("Weekly"),
                            Icon(Icons.arrow_forward_ios, size: 20),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Priority"),
                        Row(
                          children: [
                            Text("High", style: TextStyle(color: Colors.red)),
                            Icon(Icons.arrow_forward_ios, size: 20),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtasks",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "+ Add SubTask",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < 10; i++)
                        ListTile(
                          leading: Checkbox(
                            value: true,
                            onChanged: (val) {},
                            activeColor: AppColors.primaryColor,
                          ),
                          title: Text("Something"),
                        ),
                    ],
                  ),
                ),
              ),
              Text(
                "Attachments",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.primaryColor, width: 1),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      color: AppColors.primaryColor,
                    ),
                    Text(
                      "Add New File",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
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
