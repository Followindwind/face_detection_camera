import 'dart:io';
import 'package:face_detection_camera/face_detection_camera.dart';
import 'package:face_detection_camera/preview_face_image.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FaceDetectionCamera.initialize(); //Add this
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Camera',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: FaceCameraView(
              autoCapture: true,
              showControls: false,
              defaultCameraLens: CameraLens.front,
              indicatorShape: IndicatorShape.image,
              orientation: CameraOrientation.landscapeLeft,
              indicatorAssetImage: 'assets/images/face_net.png',
              onCapture: (String? image) {
                if(image!=null){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context){
                        return  PreviewFaceImage(imagePath: image,);
                      })
                  );
                }
              },
              onFaceDetected: (Face? face) {
                //Do something
              },
              messageBuilder: (context, face) {
                if (face == null) {
                  return _message('将您的脸放在相机中');
                }
                if (!face.wellPositioned) {
                  return _message('将您的脸放在正方形的中心');
                }
                return const SizedBox.shrink();
              })),
    );
  }

  Widget _message(String msg) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
        child: Text(msg,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 14, height: 1.5, fontWeight: FontWeight.w400)),
      );
}
