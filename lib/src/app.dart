import 'package:flutter/material.dart';

import 'package:flutter_blocs/src/screens/sign_in.dart';
import 'package:flutter_blocs/src/screens/home.dart';
import 'package:flutter_blocs/src/screens/splash.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      routes: {
        '/decision': (BuildContext context) => Splash(),
        '/sign_in': (BuildContext context) => SignIn(),
        '/home': (BuildContext context) => Home(),
      },
    );
  }
}
