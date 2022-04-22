import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:tunisian_sign_language/main.dart';

class SignDetection extends StatefulWidget {
  static String routeName = "/signDetection";
  const SignDetection({Key key}) : super(key: key);

  @override
  State<SignDetection> createState() => _SignDetectionState();
}

class _SignDetectionState extends State<SignDetection> {





  String answer = "";
  CameraController cameraController;
  CameraImage cameraImage;



  loadmodel() async {
    Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt"
    );
  }

  initCamera() {

     cameraController = CameraController(cameras.first, ResolutionPreset.medium);

    // OR
  /*  cameraController = CameraController(
        CameraDescription(
          name: '0', // 0 for back camera and 1 for front camera
          lensDirection: CameraLensDirection.back,
          sensorOrientation: 0,
        ),
        ResolutionPreset.medium);*/






    cameraController.initialize().then(
          (value) {
        if (!mounted) {
          return;
        }
        setState(
              () {
            cameraController.startImageStream(
                  (image) => {
                if (true)
                  {
                    // setState(
                    //   () {
                    //     cameraImage = image;
                    //   },
                    // ),
                    cameraImage = image,

                    applymodelonimages(),
                  }
              },
            );
          },
        );
      },
    );
  }

  applymodelonimages() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage.planes.map(
                (plane) {
              return plane.bytes;
            },
          ).toList(),
          imageHeight: cameraImage.height,
          imageWidth: cameraImage.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 3,
          threshold: 0.1,
          asynch: true);

      answer = '';

      predictions.forEach(
            (prediction) {
          answer +=
              prediction['label'].toString().substring(0, 1).toUpperCase() +
                  prediction['label'].toString().substring(1) +
                  " " +
                  (prediction['confidence'] as double).toStringAsFixed(3) +
                  '\n';
        },
      );

      setState(
            () {
          answer = answer;
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    initCamera();
     loadmodel();
  }

  @override
  void dispose() async {
    super.dispose();

    await Tflite.close();
    cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: cameraImage != null
              ? Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Stack(
              children: [
                Positioned(
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: AspectRatio(
                        aspectRatio: cameraController.value.aspectRatio,
                        child: CameraPreview(
                          cameraController,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.black87,
                      child: Center(
                        child: Text(
                          answer,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
              : Container(),
        ),
      ),
    );
  }



}



  /* testtttt
  bool isWorking = false;
  String result = "";
  bool isIngredient = true;
  CameraController cameraController;
  CameraImage imgCamera;
  String output;

  bool frontCamera = false;

  loadModel() async {
    await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt");
  }

  @override
  void initState() {
    super.initState();
    loadModel();
    loadCamera();
  }



  loadCamera() {  cameraController = CameraController(cameras.first, ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }

      setState(() {
        cameraController.startImageStream((image) => {
              if (!isWorking)
                {isWorking = true, imgCamera = image, runModelOnStreamFrames()}
            });
      });
    });
  }

  runModelOnStreamFrames() async {
    String label;
    double conf;

    if (imgCamera != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: imgCamera.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: imgCamera.height,
          imageWidth: imgCamera.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true);
      predictions.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
    }
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await Tflite.close();
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {





    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 35),
                        height: 270,
                        width: 360,
                        child: AspectRatio(
                          aspectRatio: cameraController.value.aspectRatio,
                          child: CameraPreview(cameraController),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 55.0),
                    child: SingleChildScrollView(
                      child: Text(
                        output != null ? output : 'output',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    /*return Scaffold(
      appBar: AppBar(
        title: Text('Live Sign Detection'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.height * 0.7,
              child: (cameraController?.value?.isInitialized ?? false)
                  ? Container()
                  : AspectRatio(
                      aspectRatio: cameraController.value.aspectRatio,
                      child: CameraPreview(cameraController),
                    ),
            ),
          ),
          Text(
            output!=null? output : 'test' ,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );*/
  }

  /*
 maryem

 CameraImage cameraImage;
  CameraController cameraController;
  String output = '';

  @override
  void initState( ) {
    super.initState();
    loadCamera();
    loadmodel();
  }

  loadCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }

  runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage.height,
          imageWidth: cameraImage.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true);
      predictions.forEach((element) {
        setState(() {
          output = element['label'];
        });
      });
    }
  }


  loadmodel()async {
    await Tflite.loadModel(model: "assets/model.tflite", labels: "assets/labels.txt");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Sign Detection'),
      ),
      body:Column(
        children: [
          Padding(padding: EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height*0.7,
            width:MediaQuery.of(context).size.height*0.7 ,
            child:(cameraController?.value?.isInitialized ?? false) ?
            Container():
            AspectRatio(aspectRatio: (this.cameraController?.value?.aspectRatio) ?? 1.1,child: CameraPreview(cameraController),),
          ),
          ),
          Text(output,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ],
      ) ,
    );
  }
}


   */
  */