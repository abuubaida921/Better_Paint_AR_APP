import 'dart:developer';

import 'package:better_painting/core/utils/constants/app_url.dart';
import 'package:better_painting/data/models/response_model/response_model.dart';
import 'package:better_painting/dependency/global%20dependency/global_controller.dart';
import 'package:better_painting/services/netwrok_services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/models/gallery_response_model/gallery_details_model.dart';
import '../../../data/models/gallery_response_model/gallery_model.dart';
import '../../../data/models/gallery_response_model/gallery_response_model.dart';

class ProjectGalleryController extends GetxController {
  final selectedButtonIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getGalleryImages();
  }

  // Sign Up loading indicator //
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;

  // Response success or error message //
  final _errorMessage = ''.obs; // Corrected declaration as RxString
  get errorMessage => _errorMessage.value;


  void setButtonIndex(int index) {
    selectedButtonIndex(index);
  }

  GalleryResponseModel _galleryResponseModel = GalleryResponseModel();
  GalleryResponseModel get galleryResponseModel => _galleryResponseModel;
  final galleryItem = <GalleryModel>[].obs;

  Future<void> getGalleryImages() async {
    try {
      if (await GlobalController().checkInternetConnectivity()) {
        _isLoading.value = true;
        final ResponseModel response =
        await NetworkCaller().getRequest(AppUrl.galleryUrl);
        if (response.isSuccess == 'success') {
          _galleryResponseModel = GalleryResponseModel.fromJson(response.responseData);
          _errorMessage.value = response.errorMessage;
          for(GalleryDetailsModel v in galleryResponseModel.details!){
            for(GalleryModel w in v.galleryModel!){
              galleryItem.add(w);
            }
          }
        } else {
          _errorMessage.value = response.errorMessage;
        }
      }
    } catch (ex) {
      if (kDebugMode) {
        print(ex);
      }
    } finally {
      _isLoading.value = false;
    }
  }

}
