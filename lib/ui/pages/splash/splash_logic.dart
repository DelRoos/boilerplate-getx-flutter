import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lion_app/model/entities/user/user_entity.dart';
import 'package:lion_app/services/api/api_service.dart';
import 'package:lion_app/services/auth_service.dart';
import 'package:lion_app/ui/commons/app_dialog.dart';
import 'package:lion_app/ui/pages/main/main_view.dart';
import 'package:lion_app/ui/pages/sign_in/sign_in_view.dart';
import 'package:lion_app/utils/logger.dart';

import 'splash_state.dart';

class SplashLogic extends GetxController {
  final state = SplashState();
  final apiService = Get.find<ApiService>();
  final authService = Get.find<AuthService>();

  void checkLogin() async {
    await Future.delayed(Duration(seconds: 2));
    if (authService.token.value == null) {
      Get.offAll(SignInPage());
    } else {
      try {
        //Profile
        UserEntity? myProfile = await apiService.getProfile();
        authService.updateUser(myProfile);
      } catch (error, s) {
        logger.log(error, stackTrace: s);
        //Check 401
        if (error is DioError) {
          if (error.response?.statusCode == 401) {
            authService.signOut();
            checkLogin();
            return;
          }
        }
        AppDialog.defaultDialog(
          message: "An error happened. Please check your connection!",
          textConfirm: "Retry",
          onConfirm: () {
            checkLogin();
          },
        );
        return;
      }
      Get.offAll(MainPage());
    }
  }
}
