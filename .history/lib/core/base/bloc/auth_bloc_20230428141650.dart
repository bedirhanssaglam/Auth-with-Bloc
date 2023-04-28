import 'dart:developer';
import 'dart:io';

import 'package:dukanimal/src/core/base/services/auth/i_auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../components/snackbar/snackbar.dart';
import '../../../init/cache/cache_manager.dart';
import '../../services/profile/i_profile_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthService authService;
  final IProfileService profileService;

  AuthBloc(this.authService, this.profileService)
      : super(const AuthState.unknown()) {
    on<AppStarted>((event, emit) async {
      try {
        if (await authService.isLoggedIn()) {
          await authService.updateTokenFromStorage();
          emit(const AuthState.authenticated());
        } else {
          emit((await authService.isFirstEntry())
              ? const AuthState.firstEntry()
              : const AuthState.guest());
        }
      } on SocketException {
        emit(AuthState.error(error: AuthError.hostUnreachable));
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        emit(AuthState.error());
      }
    });

    on<LoginRequested>(
      (event, emit) async {
        final response = await authService.login(
            email: event.email, password: event.password);
        if (response.data != null) {
          await authService.updateToken(response.data?.id);
          await authService.updateLoggedIn(true);
          await CacheManager.setString("uyeID", response.data!.id!);
          var box = await Hive.openBox("profile");
          box.put("ad", response.data!.ad);
          print('${response.data!.ad}//');
          box.put("soyad", response.data!.soyad);
          print('${response.data!.soyad}////');
          box.put("email", response.data!.email);
          print('${response.data!.email}/***');
          box.put("telefon", response.data!.telefon);
          print('${response.data!.telefon}/---');
          box.put("avatar", response.data!.avatar);
          print('${response.data!.avatar}/+++');
          print(response.sonuc);
          print("////////////////");
          emit(const AuthState.authenticated());
        } else if (response.sonuc ==
            "No Member Found in the Information You Entered") {
          snackbarWidget(
            event.context,
            message: "No member found in the information you entered.",
            isSuccess: false,
          );
          add(LogoutRequested(event.context));
          emit(AuthState.error(error: AuthError.wrongEmailOrPassword));
        }
      },
    );

    on<StoreLoginRequested>(
      (event, emit) async {
        final response = await authService.storeLogin(
            email: event.email, password: event.password);

        if (response.data != null) {
          await authService.updateToken(response.data?.id);
          await authService.updateLoggedIn(true);
          await CacheManager.setString("uyeID", response.data!.id!);
          var box = await Hive.openBox("profile");
          await box.put("adSoyad", response.data!.adSoyad);
          await box.put("telefon", response.data!.telefon);
          await box.put("magaza", response.data!.magaza);
          await box.put("avatar", response.data!.avatar);
          emit(const AuthState.authenticated());
        } else {
          snackbarWidget(
            event.context,
            message: "No member found in the information you entered.",
            isSuccess: false,
          );
          add(LogoutRequested(event.context));
          emit(AuthState.error(error: AuthError.wrongEmailOrPassword));
        }
      },
    );
    on<LogoutRequested>((event, emit) async {
      try {
        await authService.signOut();
        emit(const AuthState.guest());
        event.context.go("/login");
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
