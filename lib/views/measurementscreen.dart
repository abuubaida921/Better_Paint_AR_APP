import 'package:better_painting/controller/measurement_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Measurementscreen extends StatelessWidget {
  final MeasurementController controller = Get.find();

   Measurementscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Measurements')),
      body: Obx(() {
        return ListView(
          children: controller.measurements.entries.map((entry) {
            return ListTile(
              title: Text(entry.key),
              trailing: Text('${entry.value} cm'),
            );
          }).toList(),
        );
      }),
    );
  }
}