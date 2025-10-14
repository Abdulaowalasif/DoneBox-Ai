import 'package:doneboxai/core/conts/app_consts.dart';
import 'package:doneboxai/core/storage/app_storage.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final accessToken = AppStorage.read(AppConstants.accessToken);
  final refreshToken = AppStorage.read(AppConstants.refreshToken);
}
