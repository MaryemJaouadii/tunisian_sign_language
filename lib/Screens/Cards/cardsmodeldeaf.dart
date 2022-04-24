// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_new

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
//import 'package:flutter_tts/flutter_tts.dart';
import 'package:tunisian_sign_language/Screens/Cards/model.dart';
import 'package:tunisian_sign_language/constants.dart';

import '../../main.dart';

class CardsModel extends StatefulWidget {
  final model data;

  CardsModel(this.data);

  @override
  State<CardsModel> createState() => _CardsModelState();
}

class _CardsModelState extends State<CardsModel> {
  @override
  Widget build(BuildContext context) {
    //final FlutterTts flutterTts = FlutterTts();

    return MaterialApp(
      home: Scaffold(
        backgroundColor:MyApp.lightModeValue? kLightBackgroundColor:kDarkBackgroundColor,
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
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Align(alignment: Alignment.topRight,child: Text('التصنيفات', style: TextStyle(fontSize: 30, color: Colors.white),)),
            ),

            IconButton(onPressed: (){  setState(() {
              MyApp.lightModeValue=!MyApp.lightModeValue;
            });}, icon: MyApp.lightModeValue? Icon(Icons.wb_sunny,): Icon(Icons.nights_stay)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 70),
              child: GridView.builder(
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: widget.data.cardsname.length,
                itemBuilder: (BuildContext context, int index) {
                  return new GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FlipCard(
                        back: MyApp.lightModeValue? Container(
                          child: Card(
                            //color: Color.fromRGBO(113, 48, 148, 1),
                            color:colors[index],
                            elevation: 4,
                            margin: EdgeInsets.all(10),

                            child: Center(
                              child: InkWell(
                                  onTap: () async {
                                   // await flutterTts.speak(data.cardsname[index]);
                                  },
                                  child: Text(
                                    widget.data.cardsname[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                            ),
                          ),
                        ): BlurryContainer(
                          height: 155,
                          width: 100,
                          bgColor: Color(0xFF2a2d5e),
                          child: Center(
                            child: InkWell(
                                onTap: () async {
                                  // await flutterTts.speak(data.cardsname[index]);
                                },
                                child: Text(
                                  widget.data.cardsname[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: colors[index]),
                                )),
                          ),
                        )


                        ,
                        front: Card(
                         // color: Color.fromRGBO(113, 48, 148, 1),
                          color: colors[index],
                          elevation: 4,
                          shadowColor: Color.fromRGBO(190, 18, 277, 2),
                          margin: EdgeInsets.all(10),

                          child:
                          //Image.asset(data.src[index],)
                          Image.network(
                            widget.data.src[index],
                            // scale: 5,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
