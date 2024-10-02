// Image Section Screen //
import 'dart:io';

import 'package:better_painting/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../main.dart';

class PickImageScreen extends StatefulWidget {
  const PickImageScreen({super.key});

  @override
  State<PickImageScreen> createState() => _SelecteImageScreenState();
}

class _SelecteImageScreenState extends State<PickImageScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // Function to pick image from gallery
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Function to take a picture using the camera
  Future<void> _takePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

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
                _image != null
                    ? Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(_image!), fit: BoxFit.cover),
                          color: Colors.red,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 300,
                        width: 300,
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 10,
                ),
                _image == null
                    ? _buildServiceButton(
                        context,
                        'Select From Gallary',
                        Icons.camera_alt,
                        () async {
                          await _pickImageFromGallery();
                        },
                      )
                    : Container(),
                _image == null
                    ? _buildServiceButton(
                        context,
                        'Select From Camara',
                        Icons.photo,
                        () async {
                          await _takePhoto();
                        },
                      )
                    : Container(),
                _image != null
                    ? _buildServiceButton(
                        context,
                        'Mesaure Image',
                        Icons.architecture,
                        () {
                          Get.toNamed(RoutesNames.arMeasurementScreen,  arguments: {'imageFile': _image});
                        },
                      )
                    : Container()
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

  Widget _buildServiceButton(BuildContext context, String title, IconData icon,
      void Function()? onPressed) {
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