import 'package:flutter/material.dart';
import '../../core/conts/app_colors.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.2, // make checkbox bigger
          child: Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            splashRadius: 0,
            value: true,
            onChanged: (value) {},
            activeColor: AppColors.primaryColor,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          "DoneBox Ai",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22, // bigger text
          ),
        ),
      ],
    );
  }
}
