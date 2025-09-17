import 'package:flutter/cupertino.dart';

import '../../../core/conts/my_text_style.dart';

class AiAssistantItemCard extends StatelessWidget {
  final IconData icon;
  final String category;
  final String title;
  final Color? iconColor;
  final Color? textColor;

  const AiAssistantItemCard({
    super.key,
    required this.icon,
    required this.category,
    required this.title,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 20,
          children: [
            Icon(icon, color: iconColor),
            Text(category, style: MyTextStyle.w5s16()),
          ],
        ),
        Text(title, style: MyTextStyle.w5s16().copyWith(color: textColor)),
      ],
    );
  }
}
