import 'package:get/get.dart';

class NewTaskController extends GetxController {
  final Rx<DateTime> selectedDate = DateTime.now().obs;
}
