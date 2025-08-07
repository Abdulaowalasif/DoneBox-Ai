import 'package:doneboxai/core/conts/navIds.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/home/controller/new_task_controller.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewTaskController>();

    Future<void> selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        currentDate: DateTime.now(),
        context: context,
        initialDate: controller.selectedDate.value,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),
      );
      if (picked != null) {
        controller.selectedDate.value = picked;
      }
    }

    return Scaffold(
      appBar: CustomAppbar(title: 'New Task', navIds: NavIds.home),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    "${controller.selectedDate.value.day}, ${controller.selectedDate.value.month} ${controller.selectedDate.value.year}",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                  ),
                ),
                DateDropdown(
                  onPress: () {
                    selectDate(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                hint: Text('type your task'),
                fillColor: Color(0xFFFDF9DC),
                filled: true,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hint: Text('type your task'),
                fillColor: Color(0xFFCEE0FF),
                filled: true,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mic),
                hint: Text('Voice search'),
                fillColor: Color(0xFFCEECEB),
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                leading: Icons.add,
                text: "Add New",
                onPressed: () {},
                width: 150,
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: "Save",
              onPressed: () {},
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

class DateDropdown extends StatelessWidget {
  final VoidCallback onPress;

  const DateDropdown({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(Icons.date_range, color: Colors.grey),
            Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
