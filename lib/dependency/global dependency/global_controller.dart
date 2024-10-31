import 'package:better_painting/core/utils/constants/error_string.dart';
import 'package:better_painting/core/utils/utility/app_utils.dart';
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
      print('No Connection');
      AppUtils.errorToast(message: ErrorStrings.networkErrorMessage);
      return false;
    }
  }

  // --------------------------------------- //
  List<Map<String, dynamic>> roomDataList = [];
  List<Map<String, dynamic>> finalQuoteData = [];

  void addQuoteGenerateData({
    required String serviceId,
    required String serviceName,
    required String roomName,
    required List<String> spAreas,
    List<String>?
        addOnsOption, // Assuming add_ons should be a list of integers as in your example
    required String totalPrice,
    String? email,
    String? name,
    String? address,
  }) {
    // Create room data structure
    Map<String, dynamic> roomData = {
      "service": {"id": serviceId, "service_name": serviceName},
      "room_name": roomName,
      "specification_of_areas": spAreas,
      "add_ons": addOnsOption,
      "total_price": totalPrice,
    };

    // Add room data to the roomDataList
    roomDataList.add(roomData);

    // Add customer data if email, name, or address are not null //
    if (email != null || name != null || address != null) {
      finalQuoteData = [
        {
          "rooms": roomDataList,
          "customer": {
            "email": email,
            "name": name,
            "address": address,
          },
        }
      ];
    }
  }


  var roomName = ''.obs;
  var roomServiceName = ''.obs;
  var roomSrviceId = ''.obs;
}
