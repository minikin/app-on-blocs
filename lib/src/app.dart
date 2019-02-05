import 'package:flutter/material.dart';

import 'package:flutter_blocs/src/screens/sign_in.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),
    );
  }
}

class AppTwo extends StatefulWidget {
  _AppTwoState createState() => _AppTwoState();
}

class _AppTwoState extends State<AppTwo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),
    );
  }
}
