import 'package:get/get.dart';
import 'package:lion_app/configs/app_configs.dart';
import 'package:lion_app/model/entities/index.dart';
import 'package:lion_app/model/response/array_response.dart';
import 'package:lion_app/networks/api_client.dart';
import 'package:lion_app/networks/api_util.dart';

part 'auth_api.dart';

part 'movie_api.dart';

part 'notification_api.dart';

class ApiService extends GetxService {
  late ApiClient _apiClient;

  Future<ApiService> init() async {
    _apiClient = ApiUtil.getApiClient();
    return this;
  }
}
