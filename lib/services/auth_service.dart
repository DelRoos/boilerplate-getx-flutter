import 'package:get/get.dart';
import 'package:lion_app/database/secure_storage_helper.dart';
import 'package:lion_app/model/entities/token_entity.dart';
import 'package:lion_app/model/entities/user/user_entity.dart';

class AuthService extends GetxService {
  Rxn<TokenEntity> token = Rxn<TokenEntity>();
  Rxn<UserEntity> user = Rxn<UserEntity>();

  Future<AuthService> init() async {
    //Get current token
    final currentToken = await SecureStorageHelper.getInstance().getToken();
    token.value = currentToken;
    return this;
  }

  /// Handle save/remove Token
  void saveToken(TokenEntity token) {
    return SecureStorageHelper.getInstance().saveToken(token);
  }

  void removeToken() {
    return SecureStorageHelper.getInstance().removeToken();
  }

  /// User
  void updateUser(UserEntity user) {
    this.user.value = user;
  }

  void deleteUser() {
    this.user.value = null;
  }

  /// SignOut
  void signOut() async {
    removeToken();
    deleteUser();
  }
}
