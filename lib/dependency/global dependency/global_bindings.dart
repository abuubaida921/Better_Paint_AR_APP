
import 'package:better_painting/dependency/global%20dependency/global_controller.dart';
import 'package:get/get.dart';


class GlobalBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<GlobalController>(GlobalController(), permanent: true);
    
  }
}