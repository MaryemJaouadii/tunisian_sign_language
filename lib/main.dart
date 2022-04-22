import 'package:camera/camera.dart';
import 'package:tunisian_sign_language/OnBoarding/onBoard.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'Screens/routes.dart';


List<CameraDescription> cameras = {} as List<CameraDescription>;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  final camera = cameras.first;
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Speech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        //backgroundColor: const Color.fromRGBO(36, 36, 62, 1),
        backgroundColor: Color(0xFFffe89a),
        splashIconSize: 250,
        splashTransition: SplashTransition.scaleTransition,
        duration: 4000,
        splash: Image.asset('assets/logo_bdd.png'),
        nextScreen: OnBoardScreen(),
      ),
      routes: routes,
    );
  }
}
