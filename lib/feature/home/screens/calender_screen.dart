import 'package:doneboxai/core/conts/app_colors.dart';
import 'package:doneboxai/feature/home/controller/calender_controller.dart';
import 'package:flutter/material.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CalenderController>();

    DateTime firstDay = DateTime.utc(2020, 1, 1);
    DateTime lastDay = DateTime.utc(2030, 12, 31);

    if (controller.focusedDay.value.isBefore(firstDay)) {
      controller.focusedDay.value = firstDay;
    } else if (controller.focusedDay.value.isAfter(lastDay)) {
      controller.focusedDay.value = lastDay;
    }

    return Scaffold(
      appBar: CustomAppbar(title: "Calendar"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Smart Calendar",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              _Calender(
                firstDay: firstDay,
                lastDay: lastDay,
                controller: controller,
              ),
              CalenderMeetingCard(
                title: 'Staff Meeting',
                time: "9:00 AM",
                color: Color(0xFFDCDDF7),
              ),
              CalenderMeetingCard(
                title: 'Staff Meeting',
                time: "9:00 AM",
                color: Color(0xFFCEECEB),
              ),
              CalenderMeetingCard(
                title: 'Staff Meeting',
                time: "9:00 AM",
                color: Color(0xFFD9E7F2),
              ),
              CalenderMeetingCard(
                title: 'Staff Meeting',
                icon: Icons.local_activity,
                color: Color(0xFF72B34A),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalenderMeetingCard extends StatelessWidget {
  final String title;
  final String? time;
  final IconData? icon;
  final Color color;

  const CalenderMeetingCard({
    super.key,
    required this.title,
    this.time,
    this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(20),
      height: 70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        spacing: 10,
        children: [
          time != null ? Text(time!) : Icon(icon),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class _Calender extends StatelessWidget {
  const _Calender({
    super.key,
    required this.firstDay,
    required this.lastDay,
    required this.controller,
  });

  final DateTime firstDay;
  final DateTime lastDay;
  final CalenderController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffDEE7FF),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Calendar",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Obx(
              () => TableCalendar(
                firstDay: firstDay,
                lastDay: lastDay,
                focusedDay: controller.focusedDay.value,
                selectedDayPredicate: (day) {
                  return isSameDay(day, controller.selectedDay.value);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  controller.selectedDay.value = selectedDay;

                  controller.focusedDay.value = focusedDay;
                },
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: false,
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
