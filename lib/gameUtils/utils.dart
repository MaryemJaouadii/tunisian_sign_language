import 'package:flutter/material.dart';

class Game {
  final Color hiddenCard = Colors.red;
  List<Color> gameColors;
  List<String> gameImg;

  final String hiddenCardpath = "assets/question.png";
  List<String> cards_list = [
    "assets/family/ابن.gif",
    "assets/family/ابنة.gif",
    "gamesLabels/assets/family/ابن.gif",
    "gamesLabels/assets/family/ابنة.gif",
    "assets/family/اخ.gif",
    "assets/family/اخت.gif",
    "gamesLabels/assets/family/اخ.gif",
    "gamesLabels/assets/family/اخت.gif",
  ];
  final int cardCount = 8;
  List<Map<int, String>> matchCheck = [];

  //methods
  void initGame() {
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
