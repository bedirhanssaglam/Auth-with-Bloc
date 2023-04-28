part of 'auth_bloc.dart';

class AuthState {
  final AuthStatus status;
  final bool isFirstEntry;
  final AuthError? error;

  const AuthState._({
    this.status = AuthStatus.unknown,
    this.isFirstEntry = true,
    this.error,
  });

  const AuthState.unknown() : this._();

  const AuthState.authenticated()
      : this._(
          status: AuthStatus.authenticated,
          isFirstEntry: false,
        );

  const AuthState.guest({bool skipLogin = false})
      : this._(
          status: AuthStatus.guest,
          isFirstEntry: false,
        );

  const AuthState.firstEntry() : this._(status: AuthStatus.guest);

  AuthState.error({AuthError error = AuthError.unknown})
      : this._(status: AuthStatus.unknown, isFirstEntry: false, error: error);
}
