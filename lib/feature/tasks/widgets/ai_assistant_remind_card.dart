
import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:flutter/material.dart';

class AiAssistantRemindCard extends StatelessWidget {
  final IconData icon;
  final String category;
  final String title;
  final Color? iconColor;
  final Color? textColor;

  const AiAssistantRemindCard({
    super.key, required this.icon, required this.category, required this.title, this.iconColor, this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 20,
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor:AppColors.primaryColor ,
              child: Icon(Icons.check,color: Colors.white,),
            ),
            Text(category,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
          ],
        ),
        Switch(
          value: true,
          thumbColor: WidgetStatePropertyAll(Colors.white),
          onChanged: (value) {},
          activeColor: AppColors.primaryColor,
        ),
      ],
    );
  }
}
