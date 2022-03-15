import 'package:lion_app/model/enums/load_status.dart';
import 'package:get/get.dart';

class SplashState {
  Rx<LoadStatus> loginState = LoadStatus.initial.obs;

  SplashState() {
    ///Initialize variables
  }
}
