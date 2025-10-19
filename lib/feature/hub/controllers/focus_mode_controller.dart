import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FocusModeController extends GetxController {
  RxString timer = "25:00".obs;
  RxBool isRunning = false.obs;

  RxInt totalSeconds = RxInt(25 * 60);
  RxInt sessionTotalSeconds = RxInt(25 * 60); // ✅ fixed total for progress
  Timer? countdownTimer;

  // Session settings
  RxString sessionDescription = "Slide about showcasing new products and how they fit customer needs".obs;
  List<String> durations = ["25 min", "50 min", "Custom"];
  RxString selectedDuration = "25 min".obs;
  List<String> breaks = ["Short", "Medium", "Long"];
  RxString selectedBreak = "Short".obs;
  RxString selectedSound = "Alarm".obs;

  // Linked task
  RxString linkedTask = "Write Project report".obs;
  RxString linkedTaskCategory = "Work".obs;

  // Progress
  RxDouble progress = 0.0.obs;
  RxString sessionMessage = "You're on fire!".obs;
  RxInt completedSessions = 0.obs;

  /// Start or pause countdown
  void toggleFocusSession() {
    if (isRunning.value) {
      pauseTimer();
    } else {
      startTimer();
    }
    isRunning.value = !isRunning.value;
  }

  void startTimer() {
    countdownTimer?.cancel();

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalSeconds.value > 0) {
        totalSeconds.value--;

        final minutes = (totalSeconds.value ~/ 60).toString().padLeft(2, '0');
        final seconds = (totalSeconds.value % 60).toString().padLeft(2, '0');
        this.timer.value = "$minutes:$seconds";

        // ✅ Calculate progress based on original session duration
        progress.value = 1 - (totalSeconds.value / sessionTotalSeconds.value);
      } else {
        timer.cancel();
        isRunning.value = false;
        completedSessions.value++;
        progress.value = 1.0;
      }
    });
  }

  void pauseTimer() {
    countdownTimer?.cancel();
  }

  int _getDurationInSeconds() {
    switch (selectedDuration.value) {
      case "25 min":
        return 25 * 60;
      case "50 min":
        return 50 * 60;
      default:
        return sessionTotalSeconds.value;
    }
  }

  /// Handles duration selection
  void selectDuration(String d, {int? customMinutes}) {
    selectedDuration.value = d;

    if (d == "Custom" && customMinutes != null) {
      totalSeconds.value = customMinutes * 60;
      sessionTotalSeconds.value = customMinutes * 60;
    } else {
      totalSeconds.value = _getDurationInSeconds();
      sessionTotalSeconds.value = _getDurationInSeconds();
    }

    final minutes = (totalSeconds.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds.value % 60).toString().padLeft(2, '0');
    timer.value = "$minutes:$seconds";

    progress.value = 0.0;
    pauseTimer();
    isRunning.value = false;
  }

  void changeSound() =>
      selectedSound.value = selectedSound.value == "Alarm" ? "Bell" : "Alarm";

  void changeLinkedTask() {
    linkedTask.value = "Prepare Presentation";
    linkedTaskCategory.value = "Work";
  }

  /// Open custom duration picker
  Future<void> pickCustomDuration(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 0, minute: 25),
      helpText: "Select Custom Duration",
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final totalMinutes = picked.hour * 60 + picked.minute;
      if (totalMinutes > 0) {
        selectDuration("Custom", customMinutes: totalMinutes);
      }
    }
  }
}
