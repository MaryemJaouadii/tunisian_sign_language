import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tunisian_sign_language/OnBoarding/onBoard.dart';
import 'package:tunisian_sign_language/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => OnBoardScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ksplashScreenColor,
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Center(child: Image.asset('assets/splashscreendone.png')),
              )
            ],
          )),
    );
  }
}
