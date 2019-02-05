import 'package:flutter_blocs/src/blocs/blocs.dart' show Event;

abstract class AuthenticationEvent extends Event {
  final String name;

  AuthenticationEvent({
    this.name = '',
  });
}

class AuthenticationEventLogin extends AuthenticationEvent {
  AuthenticationEventLogin({String name})
      : super(
          name: name,
        );
}

class AuthenticationEventLogout extends AuthenticationEvent {}
