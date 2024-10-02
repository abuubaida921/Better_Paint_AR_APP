import 'package:better_painting/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main.dart';

class ServiceSelectionScreen extends StatelessWidget {
  const ServiceSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop(false);
      //       },
      //       icon: Icon(
      //         CupertinoIcons.back,
      //         color: Colors.black,
      //       )),
      //   title: Text(
      //     'Choose a Service',
      //     style: TextStyle(color: Colors.black,),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: Stack(
        children: [
          _buildBackground(),
          Image.asset(
            'assets/images/top_left.png',
            width: 120,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bottom_right.png',
              width: 120,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildServiceButton(context, 'Interior Painting', Icons.home),
                _buildServiceButton(
                    context, 'Exterior Painting', Icons.landscape),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [baseColor, baseColor],
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //   ),
      // ),
    );
  }

  Widget _buildServiceButton(
      BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton.icon(
        onPressed: () {
          Get.toNamed(RoutesNames.detailedSpecificationScreen);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        icon: Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
        label: Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}