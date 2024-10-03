import 'package:better_painting/core/utils/constants/error_string.dart';
import 'package:better_painting/core/utils/utility/app_utils.dart';
import 'package:get/get.dart';

import 'package:connectivity_plus/connectivity_plus.dart';


class  GlobalController extends GetxController {

// Checking Connecitiviy Here //
Future<bool> checkInternetConnectivity() async {
  // Check the connectivity result
  final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
  // Check if there is a mobile or wifi connection
  if (connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi) || connectivityResult.contains(ConnectivityResult.ethernet)) {
    return true;
  } else {
    print('No Connection');
    AppUtils.errorToast(message: ErrorStrings.networkErrorMessage);
    return false;
  }
}

}