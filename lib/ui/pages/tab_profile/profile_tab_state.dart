import 'package:lion_app/model/entities/index.dart';
import 'package:lion_app/model/enums/load_status.dart';
import 'package:lion_app/services/auth_service.dart';
import 'package:get/get.dart';

class ProfileTabState {
  late Rxn<UserEntity> user;

  final signOutStatus = LoadStatus.initial.obs;

  ProfileTabState() {
    final AuthService authService = Get.find<AuthService>();
    user = authService.user;
  }
}
