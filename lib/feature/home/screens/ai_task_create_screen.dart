import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AiTaskCreateScreen extends StatelessWidget {
  const AiTaskCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "AI Task Creator", onPress: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 20,
            children: [
              TextField(
                decoration: InputDecoration(
                  hint: Text("describe your task...."),
                  suffixIcon: Icon(CupertinoIcons.mic),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsetsGeometry.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.secondaryColor, width: 1),
                ),
                child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Presenting for the client meeting",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Slide about shiwcaseing new products and how they fit customer needs.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsetsGeometry.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Work",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsetsGeometry.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Personal",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsetsGeometry.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Others",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Column(
                      spacing: 10,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Due date",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "15 july",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Time",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "7:00",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Notification",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
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
                            Text(
                              "Reminder",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Weekly",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios, size: 20),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Priority",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "High",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios, size: 20),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    Container(
                      height: 1,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                      ),
                    ),

                    Row(
                      children: [
                        Icon(Icons.attach_file),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Attach File",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

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
