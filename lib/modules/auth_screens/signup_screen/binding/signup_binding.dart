import 'package:better_painting/modules/auth_screens/signup_screen/controller/signup_controller.dart';
import 'package:get/get.dart';

class SignupBinding extends Bindings {
 @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SignUpController(), fenix: true);
  }
}