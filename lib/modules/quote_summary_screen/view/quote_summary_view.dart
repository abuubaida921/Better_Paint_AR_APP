import 'package:better_painting/main.dart';
import 'package:better_painting/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuoteSummaryScreen extends StatelessWidget {
  const QuoteSummaryScreen({super.key});

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
      //         color: Colors.white,
      //       )),
      //   title: Text(
      //     'Quote Summary',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   backgroundColor: baseColor,
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Your Quote Summary',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(backgroundColor)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(RoutesNames.invoiceScreen);
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
                      'Finish',
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
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}