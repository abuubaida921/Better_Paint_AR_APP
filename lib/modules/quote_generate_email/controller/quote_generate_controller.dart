import 'dart:developer';

import 'package:better_painting/core/utils/constants/app_url.dart';
import 'package:better_painting/data/models/response_model/response_model.dart';
import 'package:better_painting/dependency/global%20dependency/global_controller.dart';
import 'package:better_painting/services/netwrok_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuoteGenerateController extends GetxController {
  // Create a TextEditingController to manage the text
  late TextEditingController emailtextEditingController;
  late TextEditingController nametextEditingController;
  late TextEditingController addresstextEditingController;

  // To store room name
  RxString emailAddress = ''.obs;
  RxString userName = ''.obs;
  RxString userAddress = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailtextEditingController = TextEditingController();
    nametextEditingController = TextEditingController();
    addresstextEditingController = TextEditingController();
  }

  // Sign Up loading indicator //
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;

  // Response success or error message //
  final _errorMessage = ''.obs; // Corrected declaration as RxString
  get errorMessage => _errorMessage.value;

  // Quote Generate Request //
 Future<bool> quoteInfoSubmit() async {
 
  try {
    if (await GlobalController().checkInternetConnectivity()) {
      _isLoading.value = true;

      final ResponseModel response = await NetworkCaller().postRequest(
        AppUrl.quotationGenerate,
        Get.find<GlobalController>().finalQuoteData,
      );

      

      if (response.isSuccess == 'success') {
        if (response.statusCode == 201) {
        _errorMessage.value = response.errorMessage;
          return true;
        } else {
          log("Unexpected successful response status code: ${response.statusCode}");
          return false;
        }
      } else {
        if (response.statusCode == 404) {
           _errorMessage.value = response.errorMessage;
        } else {
           _errorMessage.value = response.errorMessage;
        }
        return false;
      }
    } else {
      _errorMessage.value = "No internet connection.";
    }
  } catch (ex) {
    log("An error occurred: ${ex.toString()}");
    _errorMessage.value = "An unexpected error occurred. Please try again.";
    return false;
  } finally {
    _isLoading.value = false;
  }
  return false;
}

}
