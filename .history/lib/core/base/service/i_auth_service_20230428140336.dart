import '../model/auth_model.dart';

abstract class IAuthService {
  
  Future<AuthModel> login({
    required String email,
    required String password,
  });
}
