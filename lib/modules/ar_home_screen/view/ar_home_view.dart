import 'package:better_painting/core/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:better_painting/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../routes/routes_names.dart';

class ARHomePage extends StatefulWidget {
  const ARHomePage({super.key});

  @override
  State<ARHomePage> createState() => _ARHomePageState();
}

class _ARHomePageState extends State<ARHomePage> {
  String? userName;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  // Fetching User Stored Data Here
  void _getUserData() {
    if (AppStoredData.userprofileData != null) {
      setState(() {
        userName = AppStoredData.userprofileData?.firstName ?? "No Name";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          Image.asset(
            'assets/images/top_left.png',
            width: 120.w,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bottom_right.png',
              width: 120.w,
            ),
          ),
          _buildContent(context),
         // _buildUserProfileAndLogout(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
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
            height: 150.h,
            width: double.infinity,
          ),
        ),
        SizedBox(height: 30.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Welcome to Better Paintings at home estimate app',
            style: TextStyle(
              color: const Color(backgroundColor),
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Quickly customize and get a quote that fits your needs!',
            style: TextStyle(
              color: const Color(backgroundColor),
              fontSize: 16.sp,
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
            child: Text(
              'Start Your Quote',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  // Widget _buildUserProfileAndLogout() {
  //   return Positioned(
  //     top: 40.h, // Adjust top position as needed
  //     right: 20.w, // Adjust right position as needed
  //     child: Row(
  //       children: [
  //       InkWell(
  //       onTap: () {
  //         Get.toNamed(RoutesNames.userProfileScreen);
  //       },
  //         child: CircleAvatar(
  //             radius: 25,
  //             backgroundColor: Colors.grey.shade300,
  //             child: Text(
  //               userName != null && userName!.isNotEmpty
  //                   ? userName![0].toUpperCase()
  //                   : "N",
  //               style: TextStyle(fontSize: 20.sp, color: Colors.black),
  //             ),
  //           ),
  //       ),
  //          SizedBox(width: 10.w),
  //         CircleAvatar(
  //           radius: 25,
  //           backgroundColor: btnColor,
  //           child:  IconButton(
  //           icon: Icon(Icons.logout, color: Colors.white, size: 25.sp),
  //           onPressed: () async {
  //           bool isLogOut  =  await AppStoredData.userLogOut();
  //           if(isLogOut){
  //            Get.offAllNamed(RoutesNames.signInScreen);
  //           } else {
  //            print('Logout Error');
  //           }
  //           },
  //         ),
  //         ),
  //         SizedBox(width: 10.w),
         
  //       ],
  //     ),
  //   );
  // }
}
