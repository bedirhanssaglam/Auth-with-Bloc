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
    return !(await CacheManager.getBool(NetworkEnums.introOff.path) ?? false);
  }

  @override
  Future<bool> isLoggedIn() async {
    return (await CacheManager.getBool(NetworkEnums.login.path)) ?? false;
  }

  @override
  Future<void> signOut() async {
    await CacheManager.clearAll();
  }

  @override
  Future<void> updateFirstEntry() async {
    await CacheManager.setBool(NetworkEnums.introOff.path, true);
  }

  @override
  Future<void> updateLoggedIn(bool isLoggedIn) async {
    await CacheManager.setBool(NetworkEnums.login.path, isLoggedIn);
  }

  @override
  Future<void> updateToken(String? token) async {
    if (userId != null) {
      await CacheManager.setString(LocalStorage.userId.key, userId);
      // DioManager.instance.dio.options
      //     .headers[(MapEntry('Authorization', 'token $token'))];
    } else {
      if (await CacheManager.containsKey(LocalStorage.userId.key)) {
        await CacheManager.remove(LocalStorage.userId.key);
        // DioManager.instance.dio.options.headers.clear();
      }
    }
  }

  @override
  Future<void> updateTokenFromStorage() async {
    if (await CacheManager.containsKey(NetworkEnums.token.path)) {
      final userId = await CacheManager.getString(NetworkEnums.token.path);
      if (userId != null) {
        // DioManager.instance.dio.options.headers[(MapEntry('Authorization', 'token $token'))];
        // We will not need it for this application.
        // But I've included it here for instructive purposes.
      }
    }
  }
}
