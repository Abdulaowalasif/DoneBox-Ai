
import 'package:flutter/material.dart';

class HelpSupportCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text1;
  final VoidCallback? text1Tap;
  final String? text2;
  final VoidCallback? text2Tap;
  final String? text3;
  final VoidCallback? text3Tap;

  const HelpSupportCard({
    super.key,
    required this.icon,
    required this.title,
    required this.text1,
    this.text2,
    this.text3,
    this.text1Tap,
    this.text2Tap,
    this.text3Tap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 10,
                children: [
                  Icon(icon),
                  Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          GestureDetector(
            onTap: text1Tap,
            child: Text(
              text1,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          GestureDetector(
            onTap: text2Tap,
            child: Text(
              text2 ?? "",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          GestureDetector(
            onTap: text3Tap,
            child: Text(
              text3 ?? '',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
