import 'dart:async';
import 'package:get/get.dart';

class FocusModeController extends GetxController {
  RxString timer = "25:00".obs; // Default timer string
  RxBool isRunning = false.obs;

  RxInt totalSeconds = RxInt(25 * 60); // Default 25 minutes
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
    countdownTimer?.cancel(); // Cancel existing timer if any

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalSeconds.value > 0) {
        totalSeconds.value--;
        final minutes = (totalSeconds.value ~/ 60).toString().padLeft(2, '0');
        final seconds = (totalSeconds.value % 60).toString().padLeft(2, '0');
        this.timer.value = "$minutes:$seconds";

        progress.value = 1 - (totalSeconds.value / _getDurationInSeconds());
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
      case "Custom":
        return 10; // Example for testing
      default:
        return 25 * 60;
    }
  }

  /// Update duration and reset timer
  void selectDuration(String d) {
    selectedDuration.value = d;
    totalSeconds.value = _getDurationInSeconds();
    final minutes = (totalSeconds.value ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds.value % 60).toString().padLeft(2, '0');
    timer.value = "$minutes:$seconds";

    progress.value = 0.0;
    pauseTimer();
    isRunning.value = false;
  }

  void changeSound() => selectedSound.value = selectedSound.value == "Alarm" ? "Bell" : "Alarm";

  void changeLinkedTask() {
    linkedTask.value = "Prepare Presentation";
    linkedTaskCategory.value = "Work";
  }
}
