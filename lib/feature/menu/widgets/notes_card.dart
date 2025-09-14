
import 'package:flutter/material.dart';

import '../../../core/conts/app_colors.dart';

class NotesCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String time;
  final String buttonText;

  const NotesCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.time,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Text(
                time,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Text(
            subTitle,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryColor,
            ),
            onPressed: () {},
            child: Text(
              buttonText,
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
