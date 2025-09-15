import 'package:doneboxai/feature/hub/controllers/focus_mode_controller.dart';
import 'package:get/get.dart';

class FocusModeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(fenix: true,() => FocusModeController(),);
  }
}