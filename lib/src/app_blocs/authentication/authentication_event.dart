import 'package:flutter_blocs/src/blocs/blocs.dart' show Event;

abstract class AuthenticationEvent extends Event {
  final String token;

  AuthenticationEvent({
    this.token = '',
  });
}

class AuthenticationEventLogin extends AuthenticationEvent {
  AuthenticationEventLogin({String token})
      : super(
          token: token,
        );
}

class AuthenticationEventLogout extends AuthenticationEvent {}
