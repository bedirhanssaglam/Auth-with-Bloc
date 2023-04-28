import '../../init/network/dio_manager.dart';
import '../model/auth_model.dart';

abstract class IAuthService {
  final DioManager dioManager;

  IAuthService(this.dioManager);

  Future<AuthModel> login({
    required String email,
    required String password,
  });
  Future<void> signOut();
  Future<bool> isFirstEntry();
  Future<void> updateLoggedIn(bool isLoggedIn);
  Future<void> updateTokenFromStorage();
  Future<void> updateFirstEntry();
  Future<bool> isLoggedIn();
  Future<void> updateToken(String? token);
}
