import 'package:doneboxai/feature/notification/controllers/notification_pref_controller.dart';
import 'package:get/get.dart';

class NotificationPrefBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationPrefController(), fenix: true);
  }
}
