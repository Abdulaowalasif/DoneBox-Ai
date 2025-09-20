import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/conts/app_colors.dart';
import '../../../core/conts/my_text_style.dart';

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
              Text(title, style: MyTextStyle.w5s20(context)),
              Text(time, style: MyTextStyle.w4s12(context)),
            ],
          ),
          Text(subTitle, style: MyTextStyle.w5s14(context)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryColor,
            ),
            onPressed: () {},
            child: Text(
              buttonText,

              style: GoogleFonts.poppins(
                color: AppColors.primaryColor,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
