import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReminderCard extends StatelessWidget {
  final Color color;
  final String leading;
  final String title;
  final String startTime;
  final String endTime;

  const ReminderCard({
    super.key,
    required this.color,
    required this.leading,
    required this.title,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.asset(leading, height: 32, width: 32),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Row(
                spacing: 5,
                children: [
                  Text(
                    startTime,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGreen,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Text(
                    endTime,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
