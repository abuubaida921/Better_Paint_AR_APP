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

  // Response success or error message //
  final _errorMessage = ''.obs; // Corrected declaration as RxString
  get errorMessage => _errorMessage.value;

  // Model Class for Response Data //
  AuthResponseModel? _authResponseModel;
  AuthResponseModel get authResponseModel => _authResponseModel!;

  // Sign-Up Request //
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

        if (response.isSuccess == 'success') {
          _authResponseModel =
              AuthResponseModel.fromJson(response.responseData);

          if (response.statusCode == 201) {
            _errorMessage.value =
                _authResponseModel?.message ?? "Account created successfully.";
            return true;
          } else {
            // Handle other non-201 successful responses if needed
            log("Unexpected successful response status code: ${response.statusCode}");
            return false;
          }
        } else {
          // Handle error case when response.isSuccess is false
          _authResponseModel =
              AuthResponseModel.fromJson(response.responseData);

          if (response.statusCode == 400) {
            _errorMessage.value =
                _authResponseModel?.errorDetails?[0].message ?? 'This email is already exist';
          } else {
            // Handle any other error status codes if needed
            _errorMessage.value =
                "An error occurred. Status code: ${response.statusCode}";
          }
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
