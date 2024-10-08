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
  void initState()  {
  super.initState();
    // TODO: implement initState
      _getUserData();
  }
 
 // Getting Fetching User Stored Data Here
  void _getUserData (){
    if(AppStoredData.userprofileData != null){
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
          _buildContent(context,),
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

  Widget _buildContent(BuildContext context,) {
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
         SizedBox(
          height: 30.h,
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Welcome to Better Painting AR Experience',
            style:  TextStyle(
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
            'Discover our augmented reality services to enhance your world with digital experiences.',
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
            child:  Text(
              'Start Your Quote',
              style: TextStyle(
                  fontSize: 18.sp,
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