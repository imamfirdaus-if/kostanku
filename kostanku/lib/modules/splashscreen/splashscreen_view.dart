import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kostanku/HomePage.dart';

class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.white;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashDelay = 3;

  @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/logo.png',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
