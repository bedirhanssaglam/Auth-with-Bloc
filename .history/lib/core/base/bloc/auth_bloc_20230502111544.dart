import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import '../../constants/enums/auth_enums.dart';
import '../service/i_auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthService authService;

  AuthBloc(this.authService) : super(const AuthState.unknown()) {
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
        emit(const AuthState.error(error: AuthError.hostUnreachable));
      } catch (e) {
        log(e.toString());
        emit(const AuthState.error());
      }
    });

    on<LoginRequested>(
      (event, emit) async {
        final response = await authService.login(
            email: event.email, password: event.password);
        if (response.token != null) {
          log(response.token!);
          await authService.updateToken(response.token);
          await authService.updateLoggedIn(true);
          emit(const AuthState.authenticated());
        } else {
          add(LogoutRequested());
          emit(const AuthState.error(error: AuthError.wrongEmailOrPassword));
        }
      },
    );

    on<LogoutRequested>((event, emit) async {
      try {
        await authService.signOut();
        emit(const AuthState.guest());
      } catch (e) {
        log(e.toString());
      }
    });
  }
}