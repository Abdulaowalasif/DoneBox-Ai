import 'package:get/get.dart';

class CalenderController extends GetxController {
  // Focused day: the day currently displayed in the calendar
  Rx<DateTime> focusedDay = Rx<DateTime>(DateTime.now());

  // Selected day: the day selected by the user
  Rx<DateTime> selectedDay = Rx<DateTime>(DateTime.now());
}
