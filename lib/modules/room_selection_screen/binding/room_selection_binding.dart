import 'package:better_painting/modules/room_selection_screen/controller/room_selection_controller.dart';
import 'package:get/get.dart';

class RoomSelectionBinding extends Bindings {
 @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RoomSelectionController(), fenix: true);
  }
}