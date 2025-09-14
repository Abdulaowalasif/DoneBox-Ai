import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/productivity_trend_chart.dart';
import '../widgets/weekly_bar_chart.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Insights", onPress: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsGeometry.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondaryColor.withOpacity(0.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Weekly completion rate",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "50%",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: LinearProgressIndicator(
                        value: 0.5,
                        color: AppColors.primaryColor,
                        backgroundColor: AppColors.secondaryColor,
                        minHeight: 10,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Text(
                      "34 tasks completed out of 42 tasks",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Productivity Trend",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsetsGeometry.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondaryColor.withOpacity(0.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [ProductivityTrendChart()],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Category Breakdown",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            "Work",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFCEA917),
                            ),
                          ),
                          Text(
                            "Personal",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    value: 0.7,
                    color: AppColors.primaryColor,
                    backgroundColor: Color(0xFFCEA917),
                    strokeWidth: 10,
                    strokeAlign: 3,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Text(
                            "70%",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 10,
                        children: [
                          Text(
                            "30%",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFCEA917),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AI Analysis",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Your productivity increased by 12% compared to last week. Most of your completed work are in the work  category.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 200, width: 200, child: WeeklyBarChart()),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommendations",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                    ),
                    onPressed: () {
                      Share.share("Share your insights with others!");
                    },
                    child: Text(
                      "Share insights",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "\u2022 Try adding focus session in the morning",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\u2022 Prioritize pending personal task",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.save_alt, color: AppColors.primaryColor),
                        Text(
                          "Export as Pdf",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
