// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:tunisian_sign_language/OnBoarding/onBoard.dart';
import 'package:tunisian_sign_language/Screens/Game.dart';
import 'package:tunisian_sign_language/Screens/getStarted.dart';
import 'package:tunisian_sign_language/Screens/sectionOne/firstSection.dart';
import 'package:tunisian_sign_language/Screens/signDetection.dart';
import 'getStarted.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  OnBoardScreen.routeName: (context) => OnBoardScreen(),
  getStarted.routeName: (context) => getStarted(),
  SpeechScreen.routeName: (context) => SpeechScreen(),
  SignDetection.routeName: (context) => SignDetection(),
  MemoryGame.routeName: (context) => MemoryGame()
};
