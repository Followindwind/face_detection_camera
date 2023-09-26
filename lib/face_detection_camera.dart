import 'dart:async';
import 'package:camera/camera.dart';
export 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'utils/logger.dart';
export 'face_camera_view.dart';
export 'res/enums.dart';
export 'models/detected_image.dart';

class FaceDetectionCamera {
  //static const MethodChannel _channel = MethodChannel('face_camera');
  static List<CameraDescription> _cameras = [];

  /// Initialize device cameras
  static Future<void> initialize() async {
    /// Fetch the available cameras before initializing the app.
    try {
      _cameras = await availableCameras();
    } on CameraException catch (e) {
      logError(e.code, e.description);
    }
  }

  /// Returns available cameras
  static List<CameraDescription> get cameras {
    return _cameras;
  }
}
