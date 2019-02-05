import 'package:flutter_blocs/src/blocs/blocs.dart' show BlocEvent;

abstract class AuthenticationEvent extends BlocEvent {
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
