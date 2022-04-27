import 'package:flutter/material.dart';

class Game {
  final Color hiddenCard = Colors.red;
  List<Color> gameColors;
  List<String> gameImg;
  List<Color> cards = [
    Colors.green,
    Colors.yellow,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.blue
  ];
  final String hiddenCardpath = "assets/question.png";
  List<String> cards_list = [
    "assets/family/ابن.gif",
    "assets/family/ابنة.gif",
    "assets/family/ابن.gif",
    "assets/family/ابنة.gif",
    "assets/months/april.gif",
    "assets/months/june.gif",
    "assets/months/april.gif",
    "assets/months/june.gif",
  ];
  final int cardCount = 8;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGame() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}