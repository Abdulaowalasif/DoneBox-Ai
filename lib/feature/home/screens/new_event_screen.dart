import 'package:doneboxai/feature/home/controller/new_event_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../core/conts/navIds.dart';
import '../../auth/widgets/custom_button.dart';
import '../../widgets/custom_appbar.dart';
import 'new_task_screen.dart';

class NewEventScreen extends StatelessWidget {
  const NewEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewEventController>();

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
      appBar: CustomAppbar(title: 'New Event', navIds: NavIds.home),
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
                hint: Text('type your event name'),
                fillColor: Color(0xFFCEE0FF),
                filled: true,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hint: Text('type your event name'),
                fillColor: Color(0xFFCEE0FF),
                filled: true,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hint: Text('type your event name'),
                fillColor: Color(0xFFCEE0FF),
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
