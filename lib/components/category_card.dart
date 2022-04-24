import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

import '../Screens/signDetection.dart';
import '../main.dart';

class CategoryCard extends StatelessWidget {

  VoidCallback onPressed;
  String image;
  String text;
  Color cardColor;
  Color textColor;



   CategoryCard(this.onPressed,this.image,this.text , this.cardColor,this.textColor) ;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: onPressed,
        child: Stack(
          alignment: Alignment.centerRight,
          textDirection: TextDirection.rtl,
          children: [
            Align(
              alignment: Alignment.center,
              child:MyApp.lightModeValue?  Container(
               // bgColor: this.cardColor,
                width: MediaQuery.of(context).size.width - 70,
                height: 155,
               // borderRadius: BorderRadius.circular(20),
                decoration: BoxDecoration(
                  color: this.cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      width: 150,
                      child: Text(
                        this.text,
                        style: TextStyle(
                            color: this.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ):
              BlurryContainer(
                bgColor: Color(0xFF2a2d5e),
                width: MediaQuery.of(context).size.width - 70,
                height: 155,
                 borderRadius: BorderRadius.circular(20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      width: 150,
                      child: Text(
                        this.text,
                        style: TextStyle(
                            color: this.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              )
              ,
            ),
            Image.asset(this.image,
                width: 200, height: 200),
          ],
        )

      /*
                  GFCard(
                    color: Color(0xFFd8e3ff),
                    clipBehavior: Clip.antiAlias,
                    padding: EdgeInsets.all(3),
                    elevation: 3,
                    height: 195,
                    boxFit: BoxFit.cover,
                    //titlePosition: GFPosition.start,
                    //showOverlayImage: true,
                    //imageOverlay: AssetImage('assets/Chat1.png'),

                    title: GFListTile(
                      title: Text(
                        'تحب تجرب؟',
                        style: TextStyle(
                            color: Color(0xFF678ad9),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    showImage: true,
                    image:
                    Image.asset('assets/detection.png', width: 110, height: 110),
                  ),*/

    );
  }
}
