import 'package:camera/camera.dart';

class CameraService {
  CameraController? _controller;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.high);
    await _controller?.initialize();
  }

  Future<void> captureImage() async {
    final image = await _controller?.takePicture();
    // Process image and handle it
  }
}