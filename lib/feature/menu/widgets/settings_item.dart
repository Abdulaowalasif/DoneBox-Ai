import 'package:flutter/material.dart';

import '../../../core/conts/app_colors.dart';

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool? showToggle;
  final VoidCallback? toggleChanged;
  final bool? isActive;
  final VoidCallback? onPress;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    this.showToggle = false,
    this.toggleChanged,
    this.isActive,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 20,
              children: [
                Icon(icon, size: 32),
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            showToggle == true
                ? Switch(
                    value: true,
                    thumbColor: WidgetStatePropertyAll(Colors.white),
                    onChanged: (value) {},
                    activeColor: AppColors.primaryColor,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
