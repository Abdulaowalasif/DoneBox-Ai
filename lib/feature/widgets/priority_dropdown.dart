import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/conts/app_colors.dart';

class PriorityDropdown extends StatelessWidget {
  final RxString selectedPriority;

  const PriorityDropdown({super.key, required this.selectedPriority});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 18),
          borderRadius: BorderRadius.circular(10),
          value: selectedPriority.value,
          dropdownColor: AppColors.secondaryColor,
          items: const [
            DropdownMenuItem(value: "Low", child: Text("Low")),
            DropdownMenuItem(value: "Medium", child: Text("Medium")),
            DropdownMenuItem(value: "High", child: Text("High")),
          ],
          onChanged: (val) {
            if (val != null) selectedPriority.value = val;
          },
        ),
      ),
    );
  }
}
