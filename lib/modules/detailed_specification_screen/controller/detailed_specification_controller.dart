import 'package:better_painting/core/utils/constants/app_url.dart';
import 'package:better_painting/data/models/addons_respone_model/addons_response_model.dart';
import 'package:better_painting/data/models/area_spectificaiton_model/area_specificaiton_model.dart';
import 'package:better_painting/data/models/response_model/response_model.dart';
import 'package:better_painting/data/models/specification_response_model/specification_details.dart';
import 'package:better_painting/data/models/specification_response_model/specification_respone_model.dart';
import 'package:better_painting/dependency/global%20dependency/global_controller.dart';
import 'package:better_painting/services/netwrok_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailedSpecificationController extends GetxController {
  TextEditingController addOnsController = TextEditingController();

  //  late String roomName;
  //  late String roomServieId;
  //  late String roomServiceName;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //  roomServiceName = Get.arguments['serviceName'].toString();
    //  roomServieId = Get.arguments['serviceId'].toString();
    //  roomName = Get.arguments['roomName'].toString();
    // print("$roomServiceName - $roomServieId - $roomName");
    getSpecificationList();
  }

  // loading indicator //
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;

  // response success or error message //
  final _errorMessage = ''.obs;
  get errorMessage => _errorMessage;

  SpecificationResponeModel _specificationResponeModel =
      SpecificationResponeModel();
  SpecificationResponeModel get specificationResponeModel =>
      _specificationResponeModel;

  AddOnsResponseModel _addOnsResponseModel = AddOnsResponseModel();
  AddOnsResponseModel get addOnsResponseModel => _addOnsResponseModel;

  // List of detail options (like "Walls", "Doors", etc.)
  final List<SpecificationDetails> specificationOptions =
      <SpecificationDetails>[].obs;

  final List<SpecificationDetails> addOnsOption = <SpecificationDetails>[].obs;

  // Set to hold the selected and Add-Ons areas Ids //
  RxList<int> selectedAreas = RxList([]);
  RxList<int> addonsAreas = RxList([]);

  Future<void> getSpecificationList() async {
    try {
      if (await GlobalController().checkInternetConnectivity()) {
        _isLoading.value = true;
        final ResponseModel response =
            await NetworkCaller().getRequest(AppUrl.specificationUrl);
        if (response.isSuccess == 'success') {
          _specificationResponeModel =
              SpecificationResponeModel.fromJson(response.responseData);
          for (var element
              in _specificationResponeModel.specificationdetails!) {
            specificationOptions.add(SpecificationDetails(
                id: element.id,
                name: element.name,
                pricePerUnit: element.pricePerUnit));
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
          _addOnsResponseModel =
              AddOnsResponseModel.fromJson(response.responseData);
          for (var element in _addOnsResponseModel.addOnsdetails!) {
            addOnsOption.add(SpecificationDetails(
                id: element.id,
                name: element.name,
                pricePerUnit: element.pricePerUnit));
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
  void toggleArea({int? specificationId}) {
    if (selectedAreas.contains(specificationId)) {
      selectedAreas.remove(specificationId);
    } else {
      selectedAreas.add(specificationId!);
    }
    calculateTotalPrice();
  }

  void toggleAddOnsArea({int? specificationId}) {
    if (addonsAreas.contains(specificationId)) {
      addonsAreas.remove(specificationId);
    } else {
      addonsAreas.add(specificationId!);
    }
    calculateTotalPrice();
  }

  final totalPrice = 0.0.obs;

  void calculateTotalPrice() {
    double total = 0.0;

    // Sum the prices from selected areas
    total += specificationOptions
        .where((item) => selectedAreas.contains(item.id))
        .map((item) => double.tryParse(item.pricePerUnit ?? '0.0') ?? 0.0)
        .fold(0.0, (prev, element) => prev + element);

    // // Sum the prices from selected add-ons
    total += addOnsOption
        .where((item) => addonsAreas.contains(item.id))
        .map((item) => double.tryParse(item.pricePerUnit ?? '0.0') ?? 0.0)
        .fold(0.0, (prev, element) => prev + element);


    // Update the reactive totalPrice variable
    totalPrice.value = total;
  }
}
