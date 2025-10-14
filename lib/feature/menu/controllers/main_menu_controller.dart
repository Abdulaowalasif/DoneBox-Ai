import 'package:get/get.dart';

import '../../controllers/global_controllers.dart';

class MainMenuController extends GetxController {
  RxBool darkMode = false.obs;
  RxBool pauseNotification = false.obs;
  final globalController = Get.find<GlobalController>();

  Future<void> fetchProfile() async {

  }
}
