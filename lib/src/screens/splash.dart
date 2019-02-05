import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(
            fontSize: 32,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
