import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuoteGenerateController extends GetxController {

  // Create a TextEditingController to manage the text
  late TextEditingController emailtextEditingController;

  // To store room name
  RxString emailAddress = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailtextEditingController = TextEditingController();
  }


  
}
