import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomSelectionController extends GetxController {

  // Create a TextEditingController to manage the text
  TextEditingController roomtextEditingController = TextEditingController();

  // To store room name
  RxString roomName = ''.obs;

  @override
  void onClose() {
    roomtextEditingController.dispose();
    super.onClose();
  }
}
