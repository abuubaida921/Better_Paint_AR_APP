import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:better_painting/data/models/auth_respone_model/user_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStoredData {
  static UserInfoModel? userprofileData;
  static String? token;
  
  // Set User Profile info Into Sp
  static Future<void> setUserProfileData(UserInfoModel? userProfileData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'userProfileInto', jsonEncode(userProfileData!.toJson()));
  }
  
  // Set User Token Sp //
  static Future<void> setUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'user-token', token);
  }
  

  // Getting user Token That Stored //
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? userStoredToken = prefs.getString('user-token');
    return userStoredToken;
  }

  
  // Getting user profile Data that Stroed //
  static Future<UserInfoModel?> getProfileDetails() async {
    final prefs = await SharedPreferences.getInstance();
    String? userStoredProfileData = prefs.getString('userProfileInto');
    if (userStoredProfileData == null) {
      return null;
    } else {
      return UserInfoModel.fromJson(jsonDecode(userStoredProfileData));
    }
  }
   
   // Checking Inital User Data Info And Token //
   static Future<void> initalCheckUserStoredData() async {
    userprofileData = await getProfileDetails();
    token = await getToken();
    log("Stored Data: ${userprofileData?.email}");
    log("Stored Token: $token");
  }

   static Future<void> saveImageToPreferences(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_image', imagePath);
  }


  static Future<File?> loadImageFromPreferences() async {
  File? imageFile;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('user_image');
    if (imagePath != null) {
        imageFile = File(imagePath);
      
    }
     return imageFile;
  }


  static Future<bool> userLogOut()async{
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.clear();
      return true ;
    }
}
