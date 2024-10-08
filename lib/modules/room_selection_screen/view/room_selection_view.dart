import 'package:better_painting/main.dart';
import 'package:better_painting/modules/room_selection_screen/controller/room_selection_controller.dart';
import 'package:better_painting/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomSelectionView
    extends GetView<RoomSelectionController> {
  const RoomSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    'Specify Room to be Painted',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(backgroundColor)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Room Name Input
                  TextField(
                    controller: controller.roomtextEditingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Room Name',
                    ),
                    onChanged: (value) {
                      controller.roomName.value = value;
                    },
                  ),

                  const SizedBox(height: 20),

                  const SizedBox(height: 20),

                  // Button to proceed (navigate to AR Measurement screen)
                  SizedBox(
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () {
                     
                        if (controller.roomName != '') {
                          // Pass the selected areas and room name to the next screen
                          Get.toNamed(RoutesNames.detailedSpecificationScreen, arguments: {
                            'roomName': controller.roomName,
                            'serviceName' : Get.arguments['serviceName'].toString(),
                            'serviceId' : Get.arguments['serviceId'].toString()
                          });
                          
                          controller.roomtextEditingController.clear();
                        } else {
                          Get.snackbar(
                            'Incomplete Selection',
                            'Please enter the room name and then go to next page.',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: btnColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
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
