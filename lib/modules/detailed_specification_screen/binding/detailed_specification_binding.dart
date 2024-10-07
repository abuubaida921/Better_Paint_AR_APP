import 'package:better_painting/modules/detailed_specification_screen/controller/detailed_specification_controller.dart';
import 'package:get/get.dart';

class DetailedSpecificationBinding extends Bindings {
 @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DetailedSpecificationController(), fenix: true);
  }
}