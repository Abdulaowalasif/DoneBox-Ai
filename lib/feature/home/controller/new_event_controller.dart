import 'package:get/get.dart';

class NewEventController extends GetxController {
  final Rx<DateTime> selectedDate = DateTime.now().obs;
}
