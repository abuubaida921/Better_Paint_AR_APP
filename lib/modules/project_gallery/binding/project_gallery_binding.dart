import 'package:better_painting/modules/project_gallery/controller/project_gallery_controller.dart';
import 'package:get/get.dart';

import '../../quote_generate_email/controller/quote_generate_controller.dart';

class ProjectGalleryBinding extends Bindings {
@override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProjectGalleryController(), fenix: true);
    Get.lazyPut(() => QuoteGenerateController(), fenix: true);
  }

}