import 'package:doneboxai/core/conts/app_consts.dart';
import 'package:doneboxai/core/conts/endpoints.dart';
import 'package:doneboxai/core/networks/api_client.dart';
import 'package:doneboxai/core/storage/app_storage.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:get/get.dart';

import '../../controllers/global_controllers.dart';

class MainMenuController extends GetxController {
  RxBool darkMode = false.obs;
  RxBool pauseNotification = false.obs;
  final globalController = Get.find<GlobalController>();

  Future<void> fetchProfile() async {}

  Future<void> logout() async {
    try {
      final headers = {
        'Authorization': 'Bearer ${globalController.accessToken}',
      };
      final body = {"refresh_token": globalController.refreshToken};

      final response = await globalController.apiClient.post(
        Endpoints.logout,
        headers: headers,
        body: body,
      );

      print(response);
      if (response["status_code"] == 200) {
        AppStorage.remove(AppConstants.accessToken);
        AppStorage.remove(AppConstants.refreshToken);
        Get.offAllNamed(RoutesName.login);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }
}
