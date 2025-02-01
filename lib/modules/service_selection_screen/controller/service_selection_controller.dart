import 'package:better_painting/core/utils/constants/app_url.dart';
import 'package:better_painting/data/models/response_model/response_model.dart';
import 'package:better_painting/data/models/service_response_model/service_response_model.dart';
import 'package:better_painting/services/netwrok_services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../dependency/global dependency/global_controller.dart';

class ServiceSelectionController extends GetxController {
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getServiceList();
  }

  // loading indicator //
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;

  // response success or error message //
  final _errorMessage = ''.obs;
  get errorMessage => _errorMessage;

  // ServiceModel _productModel = ProductModel();
  // ProductModel get productModel => _productModel;

  ServiceResponse _serviceResponse = ServiceResponse();
  ServiceResponse get serviceResponse => _serviceResponse;

  Future<void> getServiceList() async {
    try {
      if (await GlobalController().checkInternetConnectivity()) {
        _isLoading.value = true;
        final ResponseModel response =
            await NetworkCaller().getRequest(AppUrl.serviceUrl);
        if (response.isSuccess == 'success') {
          _serviceResponse = ServiceResponse.fromJson(response.responseData);
          _errorMessage.value = response.errorMessage;
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
