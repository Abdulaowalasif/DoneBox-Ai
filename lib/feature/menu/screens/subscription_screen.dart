import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

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
                    Text(
                      "Free Plan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Your current plan",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
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
                          "Basic task management",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
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
                          "Limit reminders",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
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
                          "Comminity support",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
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
                        Text(
                          "Pro Plan",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        CustomButton(
                          text: "Upgrade",
                          onPressed: () {},
                          width: 120,
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
                          "AI free feature",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
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
                          "Unlimited tasks & project",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
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
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
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
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "\$ 50/month or \$99/year",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
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
                    Text(
                      "Enterprise Plan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
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
                          "Custom solution for teams",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                "Billing Information",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Row(
                spacing: 10,
                children: [
                  Icon(Icons.credit_card),
                  Text(
                    "Current payment method",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Change payment method",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
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
