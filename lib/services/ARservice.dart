import 'package:flutter/services.dart';

class ARService {
  static const platform = MethodChannel('com.yourapp/ar');

  Future<void> startARSession() async {
    try {
      await platform.invokeMethod('startARSession');
    } on PlatformException catch (e) {
      print("Failed to start AR session: '${e.message}'.");
    }
  }
}