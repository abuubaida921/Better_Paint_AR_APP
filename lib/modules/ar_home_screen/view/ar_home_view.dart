import 'package:better_painting/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes_names.dart';

class ARHomePage extends StatelessWidget {
  const ARHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [Colors.white, Colors.white],
      //     // colors: [Color.fromARGB(255, 174, 35, 49), Color.fromARGB(255, 15, 46, 74)],
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //   ),
      // ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset(
            'assets/images/logo_horizontal_fullcolor.png',
            height: 150,
            width: double.infinity,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Welcome to Better Painting AR Experience',
            style: TextStyle(
              color: Color(backgroundColor),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Discover our augmented reality services to enhance your world with digital experiences.',
            style: TextStyle(
              color: Color(backgroundColor),
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 40),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(RoutesNames.serviceSelectionScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: btnColor,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Start Your Quote',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}