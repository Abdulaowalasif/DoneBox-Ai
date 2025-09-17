import 'package:flutter/material.dart';
import '../../../core/conts/app_colors.dart';
import '../../../core/conts/my_text_style.dart';

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
    return Material(
      elevation: 2,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, size: 32),
                  const SizedBox(width: 20),
                  Text(title, style: MyTextStyle.w5s16()),
                ],
              ),
              showToggle == true
                  ? Switch(
                      value: isActive ?? false,
                      thumbColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      activeColor: AppColors.primaryColor,
                      onChanged: (value) => toggleChanged?.call(),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
