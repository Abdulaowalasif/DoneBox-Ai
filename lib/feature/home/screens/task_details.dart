import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conts/app_colors.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
                        const Text("Work"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Due Date"),
                        Text("15 August"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Time"),
                        Text("7:00 AM"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Notification"),
                        Switch(
                          value: true,
                          onChanged: (val) {},
                          activeColor: AppColors.primaryColor,
                          inactiveThumbColor: Colors.grey,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Reminder"),
                        Text("Weekly"),
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
              CustomButton(text: "Mark as Completed", onPressed: () {
                Get.back();
              }, width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
