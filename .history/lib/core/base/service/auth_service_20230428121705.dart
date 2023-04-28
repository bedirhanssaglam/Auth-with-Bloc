import 'package:auth_with_bloc/core/base/model/auth_model.dart';
import 'package:auth_with_bloc/core/base/service/i_auth_service.dart';

class AuthService extends IAuthService {
  @override
  Future<AuthModel> login(
      {required String email, required String password}) async {
    // TODO: implement login
    throw UnimplementedError();
  }
}
