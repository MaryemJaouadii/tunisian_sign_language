// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tunisian_sign_language/Screens/Cards/cardsmodeldeaf.dart';
import 'package:tunisian_sign_language/Screens/Cards/cardsmodelnormal.dart';
import 'package:tunisian_sign_language/Screens/Cards/mydata.dart';
import 'package:tunisian_sign_language/constants.dart';
import 'dart:math';
import 'package:blurrycontainer/blurrycontainer.dart';

import '../../main.dart';

class categoriesState extends StatefulWidget {
  String perType;
  categoriesState(this.perType);

  @override
  State<categoriesState> createState() => _categoriesStateState();
}

class _categoriesStateState extends State<categoriesState> {
  var data = mydate();

  List categList = [
    'الولايات',
    'العائلة',
    'الفصول',
    'أيام الأسبوع',
    /*  'Requests',
    'Food',
    'Feelings',
    'Clothes',
    'Colors',
    'Numbers',*/
  ];

  List catIcon = [
    Icons.family_restroom,
    Icons.emoji_people_outlined,
    Icons.place_rounded,
    Icons.timelapse_sharp,
    /* Icons.volunteer_activism_outlined,
    Icons.food_bank_rounded,
    Icons.emoji_emotions,
    Icons.checkroom_outlined,
    Icons.color_lens_outlined,
    Icons.format_list_numbered_rtl_rounded,*/
  ];

  List imagesData = [
    'assets/family.png',
    'assets/expre.jpg',
    'assets/places.png',
    'assets/time.jpg',
    /* 'assets/request.png',
    'assets/food.png',
    'assets/feeling.jpg',
    'assets/clothes.png',
    'assets/colors.jpg',
    'assets/numbers.png',*/
  ];



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: const Color.fromRGBO(36, 36, 62, 1),
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
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: categList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: () {
                        if (widget.perType == 'Deaf') {
                          if (categList[index] == 'الولايات') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModel(data.familyDate)));
                          } else if (categList[index] == 'Expressions') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModel(data.expressionData)));
                          } else if (categList[index] == 'Places') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModel(data.placesDate)));
                          } else if (categList[index] == 'Time') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModel(data.timeDate)));
                          } else if (categList[index] == 'Requests') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModel(mydate().requestsDate)));
                          } else if (categList[index] == 'Food') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModel(mydate().foodData)));
                          } else if (categList[index] == 'Feelings') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModel(mydate().feelingDate)));
                          } else if (categList[index] == 'Clothes') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModel(mydate().clothesDate)));
                          } else if (categList[index] == 'Colors') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModel(mydate().colorsDate)));
                          } else if (categList[index] == 'Numbers') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModel(mydate().numbersData)));
                          }
                        } else if (widget.perType == 'Normal') {
                          if (categList[index] == 'Family') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModelNormal(data.familyDate)));
                          } else if (categList[index] == 'الولايات') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModelNormal(data.expressionData)));
                          } else if (categList[index] == 'Places') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModelNormal(data.placesDate)));
                          } else if (categList[index] == 'Time') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModelNormal(data.timeDate)));
                          } else if (categList[index] == 'Requests') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CardsModelNormal(
                                        mydate().requestsDate)));
                          } else if (categList[index] == 'Food') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModelNormal(mydate().foodData)));
                          } else if (categList[index] == 'Feelings') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CardsModelNormal(
                                        mydate().feelingDate)));
                          } else if (categList[index] == 'Clothes') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CardsModelNormal(
                                        mydate().clothesDate)));
                          } else if (categList[index] == 'Colors') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CardsModelNormal(mydate().colorsDate)));
                          } else if (categList[index] == 'Numbers') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CardsModelNormal(
                                        mydate().numbersData)));
                          }
                        }
                      },
                      child:  MyApp.lightModeValue?


                      Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: colors[index],
                       ),
                        height: 150,
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: colors[index],
                                child: Icon(
                                  catIcon[index],
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  categList[index],
                                  style: TextStyle(
                                      color: MyApp.lightModeValue? Colors.white: colors[index],
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )

                          : BlurryContainer(
                        borderRadius: BorderRadius.circular(20),
                        bgColor: Color(0xFF2a2d5e),
                        height: 150,
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: colors[index],
                                child: Icon(
                                  catIcon[index],
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  categList[index],
                                  style: TextStyle(
                                      color: colors[index],
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
