import 'package:meta/meta.dart';
import 'package:flutter_blocs/src/blocs/blocs.dart' show State;

class AuthenticationState extends State {
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