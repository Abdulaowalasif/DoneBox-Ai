import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../../core/conts/my_text_style.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Subscription & Billing", onPress: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsGeometry.all(20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Free Plan", style: MyTextStyle.w5s20(context)),
                    Text("Your current plan", style: MyTextStyle.w5s14(context)),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 5,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        Text(
                          "Basic task management",

                          style: MyTextStyle.w5s14(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 5,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        Text("Limit reminders", style: MyTextStyle.w5s14(context)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 5,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        Text("Community support", style: MyTextStyle.w5s14(context)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsetsGeometry.all(20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pro Plan", style: MyTextStyle.w5s20(context)),
                        CustomButton(
                          text: "Upgrade",
                          onPressed: () {},
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 5,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        Text("AI free feature", style: MyTextStyle.w5s14(context)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 5,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        Text(
                          "Unlimited tasks & project",

                          style: MyTextStyle.w5s14(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 5,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        Text(
                          "Full AI task creation access",

                          style: MyTextStyle.w5s14(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 5,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        Text(
                          "Unlimited reminders & recurring tasks",

                          style: MyTextStyle.w5s14(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "\$ 50/month or \$99/year",
                      style: MyTextStyle.w7s16(context),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsetsGeometry.all(20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Enterprise Plan", style: MyTextStyle.w5s20(context)),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 5,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        Text(
                          "Custom solution for teams",

                          style: MyTextStyle.w5s14(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text("Billing Information", style: MyTextStyle.w5s20(context)),
              Row(
                spacing: 10,
                children: [
                  Icon(Icons.credit_card),
                  Text("Current payment method", style: MyTextStyle.w5s14(context)),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Change payment method",

                  style: MyTextStyle.w5s14(context).copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
