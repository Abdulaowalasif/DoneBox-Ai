import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FocusModeScreen extends StatelessWidget {
  const FocusModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Focus Mode", onPress: () {}),
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              spacing: 10,
              children: [
                Text(
                  "16:57",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                ),
                CustomButton(text: "Start", onPressed: () {}, width: 150),
                Container(
                  padding: EdgeInsetsGeometry.all(10),
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
                      Text(
                        "Session Settings",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Slide about showcasing new products and how they fit customer needs",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.watch_later_outlined),
                              Text(
                                "Duration",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 10,
                            children: [
                              Container(
                                padding: EdgeInsetsGeometry.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  "25 min",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                "50 min",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Custom",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
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
                              Text(
                                "Breaks",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Short",
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
                          Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.alarm),
                              Text(
                                "Sounds",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  "Alarm",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
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
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsetsGeometry.all(10),
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
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            child: Text(
                              "Change",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(CupertinoIcons.text_alignleft),
                              Text(
                                "Write Project report",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Work",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: LinearProgressIndicator(
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(10),
                    value: 0.4,
                    color: AppColors.primaryColor,
                    backgroundColor: AppColors.secondaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You're on fire!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "2 focus sessions completed.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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
