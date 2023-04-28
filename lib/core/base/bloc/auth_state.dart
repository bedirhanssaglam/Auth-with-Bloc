part of 'auth_bloc.dart';

@immutable
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

  const AuthState.guest()
      : this._(
          status: AuthStatus.guest,
          isFirstEntry: false,
        );

  const AuthState.firstEntry() : this._(status: AuthStatus.guest);

  const AuthState.error({AuthError error = AuthError.unknown})
      : this._(status: AuthStatus.unknown, isFirstEntry: false, error: error);
}
