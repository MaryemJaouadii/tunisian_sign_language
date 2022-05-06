import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../gameComponents/infoCard.dart';
import '../gameUtils/utils.dart';
import '../main.dart';

class MemoryGame extends StatefulWidget {
  static String routeName = "/memoryGame";
  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  //setting text style
  TextStyle whiteText = TextStyle(color: Colors.white);
  bool hideTest = false;
  Game _game = Game();

  //game stats
  int tries = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          MyApp.lightModeValue ? kLightBackgroundColor : kDarkBackgroundColor,
      body: Stack(
        children: [
          Container(
            height: 250,
            child: AppBar(
              //elevation: 15,
              toolbarHeight: 200,
              backgroundColor: Color(0xffff6db6),
              //title: Text('categories'),
              //centerTitle: true,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 3,
                    color: Color(0xFFff6db6),
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(2000),
                      bottomRight: Radius.circular(1000))),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(200),
                child: SizedBox(),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'لعبة الذاكرة',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  info_card("المحاولات", "$tries"),
                  info_card("النقاط", "$score"),
                ],
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      itemCount: _game.gameImg.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      padding: EdgeInsets.all(16.0),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print(_game.matchCheck);
                            setState(() {
                              //incrementing the clicks
                              //TODO
                              tries++;

                              _game.gameImg[index] = _game.cards_list[index];
                              _game.matchCheck
                                  .add({index: _game.cards_list[index]});
                              print(_game.matchCheck.first);
                            });
                            if (_game.matchCheck.length == 2) {
                              if (_game.matchCheck[0].values.first ==
                                  'gamesLabels/'+_game.matchCheck[1].values.first   ||  'gamesLabels/'+_game.matchCheck[0].values.first == _game.matchCheck[1].values.first  ) {
                                print("true");
                                //incrementing the score
                                score += 100;
                                _game.matchCheck.clear();
                              } else {
                                print("false");

                                Future.delayed(Duration(milliseconds: 500), () {
                                  print(_game.gameColors);
                                  setState(() {
                                    _game.gameImg[_game.matchCheck[0].keys
                                        .first] = _game.hiddenCardpath;
                                    _game.gameImg[_game.matchCheck[1].keys
                                        .first] = _game.hiddenCardpath;
                                    _game.matchCheck.clear();
                                  });
                                });
                              }
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFB46A),
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage(_game.gameImg[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ],
      ),
    );
  }
}
