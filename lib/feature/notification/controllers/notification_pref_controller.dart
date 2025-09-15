import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPrefController extends GetxController {
  RxBool isActive = false.obs;

  /// Silent hours (default: 10 PM - 2 AM)
  Rx<TimeOfDay> startTime = const TimeOfDay(hour: 22, minute: 0).obs;
  Rx<TimeOfDay> endTime = const TimeOfDay(hour: 2, minute: 0).obs;

  String formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? "AM" : "PM";
    return "$hour:$minute $period";
  }

  String get silentHours =>
      "${formatTime(startTime.value)} - ${formatTime(endTime.value)}";

  Future<void> pickSilentHours(BuildContext context) async {
    final start = await showTimePicker(
      context: context,
      initialTime: startTime.value,
    );
    if (start == null) return;

    final end = await showTimePicker(
      context: context,
      initialTime: endTime.value,
    );
    if (end == null) return;

    startTime.value = start;
    endTime.value = end;
  }
}
