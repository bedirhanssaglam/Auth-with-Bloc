import 'dart:io';

import 'package:auth_with_bloc/core/base/model/auth_model.dart';
import 'package:auth_with_bloc/core/base/service/i_auth_service.dart';

class AuthService extends IAuthService {
  AuthService(super.dioManager);

  @override
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    var response = await dioManager.dio.post(
      "login",
      data: {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      return AuthModel.fromJson(response.data);
    } else {
      return throw Exception();
    }
  }
}
