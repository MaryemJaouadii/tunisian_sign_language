import 'package:camera/camera.dart';
import 'package:tunisian_sign_language/OnBoarding/onBoard.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:tunisian_sign_language/constants.dart';
import 'Screens/routes.dart';
import 'Screens/splashScreen.dart';


List<CameraDescription> cameras = {} as List<CameraDescription>;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  final camera = cameras.first;
  runApp(MyApp());
}



class MyApp extends StatelessWidget {

  MyApp({Key key}) : super(key: key);

  static bool lightModeValue=true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'إشارتي',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
       // primarySwatch: Colors.deepPurple,
       // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(
        //backgroundColor: const Color.fromRGBO(36, 36, 62, 1),
      /*  backgroundColor: ksplashScreenColor,
       // splashIconSize: 250,
       // splashTransition: SplashTransition.scaleTransition,
        duration: 4000,
        splash:Image.asset('assets/splashscreendone.png', width: MediaQuery.of(context).size.width,),

        /* Column(
          children: [
            Text('مرحبا بيك في إشارتي'),
            Text('دليلك لتعلم لغة الإشارات التونسية'),
            Image.asset('assets/splashscreen.png')
          ],
        ),*/
        nextScreen: OnBoardScreen(),*/
      ),
      routes: routes,
    );
  }
}
