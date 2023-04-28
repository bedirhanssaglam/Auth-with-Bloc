import 'dart:io';

import 'package:auth_with_bloc/core/base/model/auth_model.dart';
import 'package:auth_with_bloc/core/base/service/i_auth_service.dart';
import 'package:auth_with_bloc/core/constants/enums/network_enums.dart';

import '../../init/cache/cache_manager.dart';

class AuthService extends IAuthService {
  AuthService(super.dioManager);

  @override
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    var response = await dioManager.dio.post(
      NetworkEnums.login.path,
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
  Future<bool> isFirstEntry() async {
    return !(await CacheManager.getBool(LocalStorage.introOff.key) ?? false);
  }

  @override
  Future<bool> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {
    await CacheManager.clearAll();
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
