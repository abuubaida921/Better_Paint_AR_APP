import 'package:better_painting/modules/user_profile_screen/controller/user_profile_controller.dart';
import 'package:get/get.dart';

class UserProfileBinding  extends Bindings{

@override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UserProfileController(), fenix: true);
  }
}