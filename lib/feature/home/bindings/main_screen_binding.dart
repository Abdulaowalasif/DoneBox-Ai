import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => BottomNavController(), permanent: true);
  }
}
