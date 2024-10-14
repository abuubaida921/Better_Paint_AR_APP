import 'dart:io';

import 'package:better_painting/core/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class UserProfileController extends GetxController{

  var imageFile = Rx<File?>(null);
  final ImagePicker picker = ImagePicker();
  


  @override
  void onInit() async {
    super.onInit();
    imageFile.value =  await AppStoredData.loadImageFromPreferences();
    await AppStoredData.getProfileDetails();
  }
  

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
      AppStoredData.saveImageToPreferences(pickedFile.path);
    }
  }



}