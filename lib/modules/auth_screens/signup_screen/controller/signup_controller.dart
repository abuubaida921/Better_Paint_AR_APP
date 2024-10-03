import 'dart:developer';

import 'package:better_painting/core/utils/constants/app_url.dart';
import 'package:better_painting/data/models/auth_respone_model/auth_response_model.dart';
import 'package:better_painting/data/models/response_model/response_model.dart';
import 'package:better_painting/dependency/global%20dependency/global_controller.dart';
import 'package:better_painting/services/netwrok_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  // loginFormGlobal Key //
  final signUpFormKeyGlobal = GlobalKey<FormState>();

  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController cPasswordTextEditingController =
      TextEditingController();

  final passwordVisibility = false.obs;
  void togglePasswordvisibility() {
    passwordVisibility.value = !passwordVisibility.value;
  }

  final cpasswordVisibility = false.obs;
  void toggleCPasswordvisibility() {
    cpasswordVisibility.value = !cpasswordVisibility.value;
  }

  // Sign Up loading indicator //
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;

  // response success or error message //
  final _errorMessage = ''.obs;
  get errorMessage => _errorMessage;

  //Model Class for Response Data //
  AuthResponseModel? authResponseModel;

  // Login Request //
  Future<bool> userSignUpFormSubmit() async {
    // User Post Body Input
    Map<String, dynamic> userSignupInfo = {
      "first_name": firstNameTextEditingController.text,
      "last_name": lastNameTextEditingController.text,
      "phone": phoneTextEditingController.text,
      "email": emailTextEditingController.text,
      "password": passwordTextEditingController.text,
    };

    try {
      if (await GlobalController().checkInternetConnectivity()) {
        _isLoading.value = true;

        final ResponseModel response = await NetworkCaller().postRequest(
          AppUrl.registrationUrl,
          userSignupInfo,
        );

        // Handle Response
        if (response.statusCode == 201) {
          print(response.isSuccess);
          log("Account Create successful.");
          log("Response data: ${response.responseData}");
          authResponseModel = AuthResponseModel.fromJson(response.responseData);
          //  errorMessage.value = authResponseModel!.details![0].message;
          return true;
        } else {
          //  errorMessage.value = authResponseModel!.details![0].message;
          return false;
        }
      }
    } catch (ex) {
      // Handle unexpected errors
      log("An error occurred: ${ex.toString()}");
      _errorMessage.value = "An unexpected error occurred. Please try again.";
      return false;
    } finally {
      // Reset loading state
      _isLoading.value = false;
    }

    return false;
  }
}
