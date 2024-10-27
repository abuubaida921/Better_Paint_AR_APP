import 'dart:async';

import 'package:better_painting/core/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:better_painting/main.dart';
import 'package:better_painting/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to ARHomePage or SignInorSingUp after a delay
    Timer(const Duration(seconds: 3), () async {
     // await AppStoredData.initalCheckUserStoredData();
    // _userInitalRouteChecker();
    Get.offAllNamed(RoutesNames.arHomeScreen);
    });
  }
  
  // get route inital check here //
  // _userInitalRouteChecker(){
  //    if((AppStoredData.token != null)){
  //   Get.offAllNamed(RoutesNames.arHomeScreen);
  //  } else{
  //   Get.offAllNamed(RoutesNames.signinOrSignUpScreen);
  //  }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_square_white.png',
                height: 200,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
