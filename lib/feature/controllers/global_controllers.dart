import 'package:doneboxai/core/conts/app_consts.dart';
import 'package:doneboxai/core/conts/endpoints.dart';
import 'package:doneboxai/core/networks/api_client.dart';
import 'package:doneboxai/core/storage/app_storage.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final accessToken = AppStorage.read(AppConstants.accessToken);
  final refreshToken = AppStorage.read(AppConstants.refreshToken);

  final apiClient = ApiClient(baseUrl: Endpoints.baseUrl);
  final aiApiClient = ApiClient(baseUrl: Endpoints.aiBaseUrl);

}
