import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomSelectionController extends GetxController {

  TextEditingController addOnsController = TextEditingController();

   // Set to hold the selected areas
  RxList<String> selectedAreas = RxList([]);
  
  // Variable to hold the room name
  RxString roomName = ''.obs;

  // List of detail options (like "Walls", "Doors", etc.)
  final RxList<String> detailOptions = ['Walls', 'Doors', 'Trim', 'Ceilings'].obs;


    // Function to handle area selection/deselection
  void toggleArea(String area) {
    
      if (selectedAreas.contains(area)) {
        selectedAreas.remove(area);
      } else {
        selectedAreas.add(area);
      }
  }
}