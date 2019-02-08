import 'package:meta/meta.dart';
import 'package:flutter_blocs/src/blocs/blocs.dart' show BlocState;

enum AuthenticationState111  {
  authenticated,
  authenticating,
  failed,
  unknow
}

class AuthenticationState extends BlocState {
  final bool authenticated;
  final bool authenticating;
  final bool failedToAuthenticated;

  AuthenticationState({
    @required this.authenticated,
    this.authenticating: false,
    this.failedToAuthenticated: false,
  });

  factory AuthenticationState.notAuthenticated() {
    return AuthenticationState(
      authenticated: false,
    );
  }

  factory AuthenticationState.authenticated() {
    return AuthenticationState(
      authenticated: true,
    );
  }

  factory AuthenticationState.authenticating() {
    return AuthenticationState(
      authenticated: false,
      authenticating: true,
    );
  }

  factory AuthenticationState.failure() {
    return AuthenticationState(
      authenticated: false,
      failedToAuthenticated: true,
    );
  }
}
