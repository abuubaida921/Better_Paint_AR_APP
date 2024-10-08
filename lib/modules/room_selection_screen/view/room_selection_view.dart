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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Room Name',
                    ),
                    onChanged: (value) {
                      controller.roomName.value = value;
                    },
                  ),

                  const SizedBox(height: 20),

                  // List of Details Otions //
                  // // List of Detail Options (Walls, Doors, etc.)
                  // Obx(
                  // () =>
                  //    Column(
                  //     children: controller.detailOptions.map((option) {
                  //       return _buildDetailOption(option);
                  //     }).toList(),
                  //   ),
                  // ),

                  // Add ons Card Section //
                  //           Card(
                  //   color: const Color(primaryColor),
                  //   elevation: 4,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(15),
                  //   ),
                  //   child: ListTile(
                  //     title: const Text(
                  //       'Add Ons',
                  //       style:  TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                  //     ),
                  //     trailing: const CircleAvatar(
                  //     backgroundColor: btnColor,
                  //     child:  Icon(

                  //     Icons.add, color: Colors.white,)),
                  //     onTap: () {
                  //       Get.defaultDialog(
                  //       titlePadding: const EdgeInsets.only(top: 25),
                  //       onCancel: () {
                  //        Get.back();
                  //       },
                  //        onConfirm: () {
                  //           Get.back();
                  //           controller.detailOptions.add(controller.addOnsController.text);
                  //           controller.addOnsController.clear();
                  //        },
                  //        title: 'Areas to be Painted',
                  //        middleText: '',
                  //        actions: [
                  //          SizedBox(
                  //          height: 40,
                  //          width: 260,
                  //           child: TextField(
                  //            controller:controller.addOnsController ,
                  //            decoration: const InputDecoration(
                  //            contentPadding: EdgeInsets.only(left: 10),
                  //             border: OutlineInputBorder(),
                  //             hintText: 'Enter you choice'
                  //            ),
                  //           ),
                  //         ),
                  //         const SizedBox(height: 20,)
                  //        ]
                  //       );
                  //     },
                  //   ),
                  // ),

                  const SizedBox(height: 20),

                  // Button to proceed (navigate to AR Measurement screen)
                  SizedBox(
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.roomName != null &&
                            controller.selectedAreas.isNotEmpty) {
                          // Pass the selected areas and room name to the next screen
                          Get.toNamed(RoutesNames.pickIamgeScreen, arguments: {
                            'roomName': controller.roomName,
                            'selectedAreas': controller.selectedAreas
                          });
                        } else {
                          Get.snackbar(
                            'Incomplete Selection',
                            'Please enter the room name and select at least one area.',
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

  // Widget for Detail Option (Toggles between selected/deselected)
  Widget _buildDetailOption(String title) {
    return Obx(() {
      bool isSelected = controller.selectedAreas.contains(title);
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          color: isSelected ? Colors.blue[50] : Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected ? Colors.blueAccent : Colors.grey,
            ),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              controller.toggleArea(title);
            },
          ),
        ),
      );
    });
  }
}
