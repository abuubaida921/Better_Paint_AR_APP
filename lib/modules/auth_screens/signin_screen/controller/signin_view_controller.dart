import 'dart:developer';

import 'package:better_painting/core/utils/constants/app_url.dart';
import 'package:better_painting/core/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:better_painting/data/models/auth_respone_model/auth_response_model.dart';
import 'package:better_painting/data/models/response_model/response_model.dart';
import 'package:better_painting/dependency/global%20dependency/global_controller.dart';
import 'package:better_painting/services/netwrok_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninViewController extends GetxController {
  // loginFormGlobal Key //
  final singInFormKeyGlobal = GlobalKey<FormState>();

 
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


  final passwordVisibility = false.obs;
  void togglePasswordvisibility() {
    passwordVisibility.value = !passwordVisibility.value;
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
  Future<bool> userSignInFormSubmit() async {
    // User Post Body Input
    Map<String, dynamic> userSignupInfo = {
      "email": emailTextEditingController.text,
      "password": passwordTextEditingController.text,
    };

    try {
      if (await GlobalController().checkInternetConnectivity()) {
        _isLoading.value = true;

        final ResponseModel response = await NetworkCaller().postRequest(
          AppUrl.signInUrl,
          userSignupInfo,
        );

        if (response.isSuccess == 'success') {
          _authResponseModel =
              AuthResponseModel.fromJson(response.responseData);   

          if (response.statusCode == 200) {

      
          // Stroed User Info Into Shared Preferences //
          await AppStoredData.setUserToken(_authResponseModel!.userData!.token  ?? '');
            
            _errorMessage.value =
                _authResponseModel?.message ?? "Data successfully returned";
            return true;
          } else {
            // Handle other non-201 successful responses if needed
            log("Unexpected successful response status code: ${response.statusCode}");
            return false;
          }

          // Handle error case when response.isSuccess is false
        } else {  
          _authResponseModel =
              AuthResponseModel.fromJson(response.responseData);

          if (response.statusCode == 404) {
            _errorMessage.value =
                _authResponseModel?.errorDetails?[0].message ?? "Password doen't match";
          } else {
            // Handle any other error status codes if needed
            _errorMessage.value = _authResponseModel!.message.toString();
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
