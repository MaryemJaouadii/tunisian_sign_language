// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tunisian_sign_language/Screens/Cards/categories.dart';
import 'package:tunisian_sign_language/Screens/Game.dart';
import 'package:tunisian_sign_language/Screens/signDetection.dart';
import 'package:tunisian_sign_language/components/category_card.dart';
import 'package:tunisian_sign_language/constants.dart';
import 'package:tunisian_sign_language/main.dart';

class getStarted extends StatefulWidget {
  const getStarted({Key key}) : super(key: key);
  static String routeName = "/getStarted";
  @override
  _getStartedState createState() => _getStartedState();
}

class _getStartedState extends State<getStarted> {
  @override
  Widget build(BuildContext context) {
    String personType1 = 'Deaf';
    String personType2 = 'Normal';
    return Scaffold(

        /*  appBar: AppBar(
          title: Align(alignment: Alignment.centerRight,child: Image.asset('assets/logo_bdd_text.png', width: 100,)),

          toolbarHeight: 100,
          backgroundColor: kBackgroundColor,
          elevation: 0,
          centerTitle: false,

        ),*/
        //backgroundColor: Color.fromRGBO(36, 36, 62, 1),
        // backgroundColor: Color(0xFFFEF9EE),
        backgroundColor:
            MyApp.lightModeValue ? kLightBackgroundColor : kDarkBackgroundColor,
        body: SafeArea(
          child: Stack(
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
              Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/logo_bdd_text.png',
                    width: 100,
                  )),
              /* CupertinoSwitch(

                value: MyApp.lightModeValue,
                onChanged: (value) {
                  setState(() {
                    MyApp.lightModeValue = value;
                    print(MyApp.lightModeValue);
                  });
                },
              ),*/

              IconButton(
                  onPressed: () {
                    MyApp.lightModeValue = !MyApp.lightModeValue;
                    setState(() {});
                  },
                  icon: MyApp.lightModeValue
                      ? Icon(
                          Icons.wb_sunny,
                          color: Colors.amberAccent,
                        )
                      : Icon(
                          Icons.nights_stay,
                          color: Colors.blueGrey,
                        )),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 90),
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CategoryCard(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => categoriesState(personType1),
                          ),
                        );
                      }, 'assets/sign_language.png', 'لغة الإشارات',
                          Color(0xFFfff4ce), Color(0xFFdfb454)),
                      CategoryCard(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => categoriesState(personType2),
                          ),
                        );
                      }, 'assets/wordstosign.png', 'كلمات إلى لغة الإشارات',
                          Color(0xFFffeafc), Color(0xFFcd93c7)),
                      CategoryCard(() {
                        Navigator.pushNamed(context, SignDetection.routeName);
                      }, 'assets/detection.png', 'تحب تجرب؟', Color(0xFFd8e3ff),
                          Color(0xFF678ad9)),
                      CategoryCard(() {
                        Navigator.pushNamed(context, MemoryGame.routeName);
                      }, 'assets/question.png', 'يلا نلعبو', Colors.green[100],
                          Colors.green)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
