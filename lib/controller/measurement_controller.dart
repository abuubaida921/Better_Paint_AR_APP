import 'package:get/get.dart';

class MeasurementController extends GetxController {
  var measurements = <String, double>{}.obs;

  void addMeasurement(String item, double measurement) {
    measurements[item] = measurement;
  }

  void removeMeasurement(String item) {
    measurements.remove(item);
  }
}