import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doneboxai/core/conts/app_colors.dart';

class CategoryDropdown extends StatelessWidget {
  final RxString selectedCategory;

  const CategoryDropdown({Key? key, required this.selectedCategory})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 18),
          borderRadius: BorderRadius.circular(10),
          dropdownColor: AppColors.secondaryColor,
          value: selectedCategory.value,
          items: const [
            DropdownMenuItem(value: "Work", child: Text("Work")),
            DropdownMenuItem(value: "Personal", child: Text("Personal")),
            DropdownMenuItem(value: "Shopping", child: Text("Shopping")),
          ],
          onChanged: (value) {
            if (value != null) {
              selectedCategory.value = value;
            }
          },
        ),
      ),
    );
  }
}
