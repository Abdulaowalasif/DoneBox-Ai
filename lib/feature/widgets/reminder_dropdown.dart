import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doneboxai/core/conts/app_colors.dart';

class ReminderDropdown extends StatelessWidget {
  final RxString selectedReminder;

  const ReminderDropdown({Key? key, required this.selectedReminder})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 18),
          borderRadius: BorderRadius.circular(10),
          dropdownColor: AppColors.secondaryColor,
          value: selectedReminder.value,
          items: const [
            DropdownMenuItem(value: "Daily", child: Text("Daily")),
            DropdownMenuItem(value: "Weekly", child: Text("Weekly")),
            DropdownMenuItem(value: "Monthly", child: Text("Monthly")),
          ],
          onChanged: (value) {
            if (value != null) {
              selectedReminder.value = value;
            }
          },
        ),
      ),
    );
  }
}
