import 'dart:io';
import 'package:better_painting/data/models/room_model/room_model.dart';
import 'package:better_painting/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../main.dart';

class PickImageScreen extends StatefulWidget {
  const PickImageScreen({super.key});

  @override
  State<PickImageScreen> createState() => _PickImageScreenState();
}

class _PickImageScreenState extends State<PickImageScreen> {
  final ImagePicker _picker = ImagePicker();
  
  //final List<XFile> _selectedImages = [];
  final List<Room> _rooms = [];

  // Get arguments passed from the previous screen
  late final String roomName;
  late final List<String> selectedAreas;

  @override
  void initState() {
    super.initState();
    roomName = Get.arguments['roomName']?? 'Unnamed Room';
    selectedAreas = (Get.arguments['selectedAreas']);
  }

  // Function to add a new room
  void _addRoom(List<XFile> roomImages,) {
    setState(() {
      _rooms.add(Room(
        name: roomName,
        images: roomImages,
        specifyAreas: selectedAreas,
      ));
    });
  }

  // Function to pick images from the gallery
  Future<void> _pickImageFromGallery() async {
    final List<XFile> pickedImages = await _picker.pickMultiImage();
    if (pickedImages.isNotEmpty) {
      setState(() {
        _addRoom(pickedImages);
      });
      // Get.back(); // Uncomment if you want to navigate back after picking images
    }
  }

  // Function to take a picture using the camera (not implemented yet)
  Future<void> _takePhoto() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
       // Add a single image to the list
        setState(() {
          _addRoom([pickedFile]);
           
        });
       //Get.back(); 
    }
  }

  // Function to add more images (either from camera or gallery)
  void addMoreImage(int index) {
    Get.defaultDialog(
      title: 'Want to add more images?',
      middleText: 'Select your image source',
      titlePadding: const EdgeInsets.all(20),
      confirm: GestureDetector(
        onTap: () {
          Get.back(); // Close the dialog
           _takePhoto(); // Uncomment when implementing camera feature
        },
        child: const CircleAvatar(
          child: Icon(Icons.camera_alt_rounded),
        ),
      ),
      cancel: GestureDetector(
        onTap: () {
          Get.back(); // Close the dialog
          _pickImageFromGallery(); // Call the function to pick an image from gallery
        },
        child: const CircleAvatar(
          child: Icon(Icons.image),
        ),
      ),
    );
  }

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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_rooms.isNotEmpty) // Check if rooms have been added
                  SizedBox(
                    height: 500,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: _rooms.length,
                        itemBuilder: (context, index) {
                          final room = _rooms[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Room: ${room.name} - Specifications: ${room.specifyAreas.join(', ')}',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, // Customize the layout
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                ),
                                itemCount: room.images.length + 1, // +1 for add more button
                                itemBuilder: (context, imgIndex) {
                                  if (imgIndex == room.images.length) {
                                    return GestureDetector(
                                      onTap: () =>  addMoreImage(index),
                                      child: Container(
                                        color: Colors.grey[300],
                                        child: const Center(
                                          child: Icon(Icons.add_a_photo, size: 50),
                                        ),
                                      ),
                                    );
                                  }

                                  // Display selected images
                                  return Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(File(room.images[imgIndex].path)),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                const SizedBox(height: 10),
                if (_rooms.isEmpty)
                  _buildServiceButton(
                    context,
                    'Select From Gallery',
                    Icons.image,
                    _pickImageFromGallery,
                  ),
                if (_rooms.isEmpty)
                  _buildServiceButton(
                    context,
                    'Select From Camera',
                    Icons.camera_alt,
                    () {
                      // Implement camera functionality
                    },
                  ),
                if (_rooms.isNotEmpty)
                  _buildServiceButton(
                    context,
                    'Measure Image',
                    Icons.architecture,
                    () {
                      Get.toNamed(RoutesNames.arMeasurementScreen,
                         );
                    },
                  ),
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
    );
  }

  Widget _buildServiceButton(
    BuildContext context,
    String title,
    IconData icon,
    void Function()? onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        icon: Icon(icon, size: 30, color: Colors.white),
        label: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
