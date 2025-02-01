import 'package:better_painting/core/utils/constants/error_string.dart';
import 'package:better_painting/core/utils/utility/app_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

class GlobalController extends GetxController {
// Checking Connecitiviy Here //
  Future<bool> checkInternetConnectivity() async {
    // Check the connectivity result
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    // Check if there is a mobile or wifi connection
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    } else {
      if (kDebugMode) {
        print('No Connection');
      }
      AppUtils.errorToast(message: ErrorStrings.networkErrorMessage);
      return false;
    }
  }

  // == Post Data Format for Quote Generate == //
  // --------------------------------------- //
  List<Map<String, dynamic>> roomDataList = [];
  Map<String, dynamic> finalQuoteData = {};

  void addQuoteGenerateData({
    required String serviceId,
    required String serviceName,
    required String roomName,
    required List<int> spAreas,
    List<int>? addOnsOption,
    required String totalPrice,
    String? email,
    String? name,
    String? address,
  }) {
    // Create room data structure
    Map<String, dynamic> roomData = {
      "service": {"id": serviceId, "service_name": serviceName},
      "quote_room_name": roomName,
      "specification_of_areas": spAreas,
      "add_ons": addOnsOption,
      "total_price": totalPrice,
    };

    // Add room data to the roomDataList
    roomDataList.add(roomData);

    // Add customer data if email, name, or address are not null //
    if (email != null || name != null || address != null) {
      finalQuoteData = {
        "rooms": roomDataList,
        "customer": {
          "email": email,
          "name": name,
          "address": address,
        },
      };
    }
  }

  var roomName = ''.obs;
  var roomServiceName = ''.obs;
  var roomSrviceId = ''.obs;
}
