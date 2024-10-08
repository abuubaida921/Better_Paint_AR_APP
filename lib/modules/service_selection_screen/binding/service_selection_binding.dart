import 'package:better_painting/modules/service_selection_screen/controller/service_selection_controller.dart';
import 'package:get/get.dart';

class ServiceSelectionBinding extends Bindings {

 @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ServiceSelectionController(), fenix: true);
  }
}