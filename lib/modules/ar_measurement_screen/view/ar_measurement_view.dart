// Measure object from Picture //
import 'dart:io';
import 'dart:math';

import 'package:better_painting/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes_names.dart';
import 'line_painter_widget.dart';

class ARMeasurementScreen extends StatefulWidget {
  const ARMeasurementScreen({super.key});

  @override
  State<ARMeasurementScreen> createState() => _ARMeasurementScreenState();
}

class _ARMeasurementScreenState extends State<ARMeasurementScreen> {
  @override
   List<Offset> _points = []; // Points to store drawn lines

  // Calculate distance between two points
  double _calculateDistance(Offset start, Offset end) {
    return sqrt(pow(end.dx - start.dx, 2) + pow(end.dy - start.dy, 2));
  }

  @override
  Widget build(BuildContext context) {
    var selectedColorIndex = 0.obs;
    List<Color> colorList = [
      const Color(0xFF000000), // Black
      const Color(0xFF0000FF), // Blue
      const Color(0xFFFF0000), // Red
      const Color(0xFF00FF00), // Green
    ];

    // Get arguments passed from the previous screen
   final imageFile = Get.arguments['imageFile'];

   

    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _points.add(details.localPosition);
              });
            },
            onPanEnd: (details) {
              if (_points.length > 1) {
                // Show distance between the first and last points
                final start = _points.first;
                final end = _points.last;
                final distance = _calculateDistance(start, end);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Distance: ${distance.toStringAsFixed(2)} px'),
                ));
              }
            },
            child: Stack(
              children: [
                // Display the image
                Image.file(
                  imageFile!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
                // CustomPaint to draw lines on the image
                CustomPaint(
                  painter: LinePainter(_points),
                  size: const Size(double.infinity, 300),
                ),
              ],
            ),
          ),
          // Color selection and other UI components...
          Obx(
            () => Positioned(
              top: 360,
              child: Row(
                children: [
                  for (int i = 0; i < colorList.length; i++)
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        selectedColorIndex.value = i;
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 9),
                        height: 28,
                        width: 28,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedColorIndex.value == i
                                ? const Color(0xFF000000) // Replace with actual primary color
                                : Colors.transparent,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: colorList[i],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),

                    
                ],
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 380,
                  ),
                  const Text(
                    'Home Decor',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(primaryColor)),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 80),
                  ElevatedButton(
                    onPressed: () {
                       Get.toNamed(RoutesNames.quoteSummaryScreen);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Quote Summary',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
    );
  }
  }