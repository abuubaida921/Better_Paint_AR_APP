import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomSelectionController extends GetxController {

  // Create a TextEditingController to manage the text
  late TextEditingController roomtextEditingController;

  // To store room name
  RxString roomName = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    roomtextEditingController = TextEditingController();
  }

  // @override
  // void onClose() {
  // super.onClose();
  // roomtextEditingController.dispose();
  // }

  
}
