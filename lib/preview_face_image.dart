import 'dart:io';

import 'package:face_detection_camera/face_detection_camera.dart';
import 'package:flutter/material.dart';

class PreviewFaceImage extends StatefulWidget {
  String imagePath;
  PreviewFaceImage({super.key,required this.imagePath});

  @override
  State<PreviewFaceImage> createState() => _PreviewFaceImageState();

}

class _PreviewFaceImageState extends State<PreviewFaceImage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('检测到的人脸图片'),),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
        child: Image.file(File(widget.imagePath),width: double.maxFinite,height: double.infinity,),
      ),
    );
  }

}