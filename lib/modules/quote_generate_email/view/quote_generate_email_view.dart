import 'package:better_painting/dependency/global%20dependency/global_controller.dart';
import 'package:better_painting/main.dart';
import 'package:better_painting/modules/quote_generate_email/controller/quote_generate_controller.dart';
import 'package:better_painting/modules/room_selection_screen/controller/room_selection_controller.dart';
import 'package:better_painting/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class QuoteGenerateEmailView
    extends GetView<QuoteGenerateController> {
  const QuoteGenerateEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    'Email To Generate Quotes',
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(backgroundColor)),
                    textAlign: TextAlign.center,
                  ),
                   SizedBox(height: 20.h),
    
                  // Room Name Input
                  TextField(
                    controller: controller.emailtextEditingController,
                    decoration: const InputDecoration(
                     focusColor: btnColor,
                     focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: btnColor, width: 1.2)
    
                     ),
                      border: OutlineInputBorder(
                      ),
                      labelText: 'Enter Email Address',
                    ),
                    onChanged: (value) {
                      controller.emailAddress.value = value;
                    },
                  ),
    
                  SizedBox(height: 20.h),
    
                  
    
                  // Button to proceed (navigate to AR Measurement screen)
                  SizedBox(
                    width: 150.w,
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.emailAddress != '') {
                          Get.toNamed(RoutesNames.invoiceScreen, 
                          );
                          controller.emailtextEditingController.clear();
                        } else {
                          Get.snackbar(
                            'Incomplete Selection',
                            'Please enter the email address and then go to next page.',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: btnColor,
                        padding:  EdgeInsets.symmetric(
                            horizontal: 40.w, vertical: 15.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 5.h,
                          ),
                          const Icon(
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