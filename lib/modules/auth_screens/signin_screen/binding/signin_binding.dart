import 'package:better_painting/modules/auth_screens/signin_screen/controller/signin_view_controller.dart';
import 'package:get/get.dart';

class SigninBinding extends Bindings {
 @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SigninViewController(), fenix: true);
  }
}