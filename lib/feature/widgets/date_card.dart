import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/feature/widgets/reminder_card.dart';
import 'package:flutter/material.dart';

import '../../core/conts/app_colors.dart';

class DateCard extends StatelessWidget {
  const DateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          Text(
            'Monday, July 31',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 20),
          ReminderCard(
            color: Color(0xFFDCDDF7),
            leading: ImageConst.meeting,
            title: 'Meeting',
            startTime: '9:00 AM',
            endTime: '10:00 AM',
          ),
          const SizedBox(height: 20),
          ReminderCard(
            color: Color(0xFFCEECEB),
            leading: ImageConst.reading,
            title: 'Reading',
            startTime: '11:00 AM',
            endTime: '12:00 AM',
          ),
          const SizedBox(height: 20),
          ReminderCard(
            color: Color(0xFFD9E7F2),
            leading: ImageConst.exercise,
            title: 'Exercise',
            startTime: '4:00 AM',
            endTime: '6:00 AM',
          ),
          const SizedBox(height: 20),
          ReminderCard(
            color: Color(0xFF9E8B1D),
            leading: ImageConst.meeting,
            title: 'Meeting',
            startTime: '9:00 AM',
            endTime: '10:00 AM',
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'See More',
                style: TextStyle(color: AppColors.buttonColor, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
