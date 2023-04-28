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

  @override
  Future<bool> isFirstEntry() {
    // TODO: implement isFirstEntry
    throw UnimplementedError();
  }

  @override
  Future<bool> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> updateFirstEntry() {
    // TODO: implement updateFirstEntry
    throw UnimplementedError();
  }

  @override
  Future<void> updateLoggedIn(bool isLoggedIn) {
    // TODO: implement updateLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<void> updateToken(String? token) {
    // TODO: implement updateToken
    throw UnimplementedError();
  }

  @override
  Future<void> updateTokenFromStorage() {
    // TODO: implement updateTokenFromStorage
    throw UnimplementedError();
  }
}
