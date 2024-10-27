import 'package:better_painting/modules/quote_generate_email/controller/quote_generate_controller.dart';
import 'package:get/get.dart';

class QuoteGenerateBinding extends Bindings {
@override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => QuoteGenerateController(), fenix: true);
  }

}