import 'package:flutter_blocs/src/blocs/blocs.dart';

import 'package:flutter_blocs/src/app_blocs/authentication/authentication_event.dart';
import 'package:flutter_blocs/src/app_blocs/authentication/authentication_state.dart';

class AuthenticationBloc
    extends EventToState<AuthenticationEvent, AuthenticationState> {
  @override
  Stream<AuthenticationState> eventHandler(
      AuthenticationEvent event, AuthenticationState currentState) async* {
    if (event is AuthenticationEventLogin) {
      yield AuthenticationState.authenticating();

      // Simulate a call to the authentication server
      await Future.delayed(const Duration(seconds: 2));

      if (event.name == "failure") {
        yield AuthenticationState.failure();
      } else {
        yield AuthenticationState.authenticated(event.name);
      }
    }

    if (event is AuthenticationEventLogout) {
      yield AuthenticationState.notAuthenticated();
    }
  }
}
