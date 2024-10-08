import 'package:better_painting/core/utils/constants/app_url.dart';
import 'package:better_painting/data/models/addons_respone_model/addons_response_model.dart';
import 'package:better_painting/data/models/response_model/response_model.dart';
import 'package:better_painting/data/models/specification_response_model/specification_details.dart';
import 'package:better_painting/data/models/specification_response_model/specification_respone_model.dart';
import 'package:better_painting/dependency/global%20dependency/global_controller.dart';
import 'package:better_painting/services/netwrok_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailedSpecificationController extends GetxController{

   TextEditingController addOnsController = TextEditingController();

   
  



   @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var serviceName = Get.arguments['serviceName'].toString();
    var serviceId = Get.arguments['serviceId'].toString();
    var roomName = Get.arguments['roomName'].toString();
    print("$serviceName - $serviceId - $roomName");
    getSpecificationList();
  }

  // loading indicator //
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;

  // response success or error message //
  final _errorMessage = ''.obs;
  get errorMessage => _errorMessage;


  SpecificationResponeModel _specificationResponeModel = SpecificationResponeModel();
  SpecificationResponeModel get specificationResponeModel => _specificationResponeModel;

  AddOnsResponseModel _addOnsResponseModel = AddOnsResponseModel();
  AddOnsResponseModel get addOnsResponseModel => _addOnsResponseModel;

  
  // List of detail options (like "Walls", "Doors", etc.)
  final  detailOptions = [].obs;

  final addOnsOption = [].obs;

  // Set to hold the selected areas
  RxList<String> selectedAreas = RxList([]);

  Future<void> getSpecificationList() async {
    try {
      if (await GlobalController().checkInternetConnectivity()) {
        _isLoading.value = true;
        final ResponseModel response =
            await NetworkCaller().getRequest(AppUrl.specificationUrl);
        if (response.isSuccess == 'success') {
          _specificationResponeModel = SpecificationResponeModel.fromJson(response.responseData);
          for (var element in _specificationResponeModel.specificationdetails!) {
            detailOptions.add(element.name!);
          }
          _errorMessage.value = response.errorMessage;
        } else {
          _errorMessage.value = response.errorMessage;
        }
      }
    } catch (ex) {
      print(ex);
    } finally {
      _isLoading.value = false;
    }
  }

   
  final _isAddOnsLoading = false.obs;
  get isAddOnsLoading => _isAddOnsLoading.value;

   Future<void> getAddOnsList() async {
    try {
      if (await GlobalController().checkInternetConnectivity()) {
        _isAddOnsLoading.value = true;
        final ResponseModel response =
            await NetworkCaller().getRequest(AppUrl.addOnsUrl);
        if (response.isSuccess == 'success') {
          addOnsOption.clear();
          _addOnsResponseModel = AddOnsResponseModel.fromJson(response.responseData);
          for (var element in _addOnsResponseModel.addOnsdetails!) {
            addOnsOption.add(element.name!);
          }
          _errorMessage.value = response.errorMessage;
        } else {
          _errorMessage.value = response.errorMessage;
        }
      }
    } catch (ex) {
      print(ex);
    } finally {
      _isAddOnsLoading.value = false;
    }
  }


    // Function to handle area selection/deselection
  void toggleArea(String area) {
    
      if (selectedAreas.contains(area)) {
        selectedAreas.remove(area);
      } else {
        selectedAreas.add(area);
      }
  }



  

}