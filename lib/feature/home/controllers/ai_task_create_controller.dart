import 'package:get/get.dart';

class AiTaskCreateController extends GetxController {
  // Task details
  RxString taskTitle = "Presenting for the client meeting".obs;
  RxString taskDescription =
      "Slide about showcasing new products and how they fit customer needs.".obs;

  // Category
  RxString selectedCategory = "Work".obs;
  final List<String> categories = ["Work", "Personal", "Others"];

  // Date & Time
  RxString dueDate = "15 July".obs;
  RxString time = "7:00".obs;

  // Switches & Dropdowns
  RxBool isNotificationOn = false.obs;
  RxString reminder = "Weekly".obs;
  RxString priority = "High".obs;

  // File Attachment
  RxString attachedFile = "".obs;

  // Methods to update values
  void setCategory(String value) => selectedCategory.value = value;
  void setReminder(String value) => reminder.value = value;
  void setPriority(String value) => priority.value = value;
  void setDueDate(String value) => dueDate.value = value;
  void setTime(String value) => time.value = value;
  void attachFile(String filePath) => attachedFile.value = filePath;
}
