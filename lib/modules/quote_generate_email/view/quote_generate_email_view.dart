import 'dart:convert';

import 'package:better_painting/core/utils/utility/app_utils.dart';
import 'package:better_painting/dependency/global%20dependency/global_controller.dart';
import 'package:better_painting/main.dart';
import 'package:better_painting/modules/detailed_specification_screen/controller/detailed_specification_controller.dart';
import 'package:better_painting/modules/quote_generate_email/controller/quote_generate_controller.dart';
import 'package:better_painting/modules/room_selection_screen/controller/room_selection_controller.dart';
import 'package:better_painting/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class QuoteGenerateEmailView extends GetView<QuoteGenerateController> {
  QuoteGenerateEmailView({super.key});

  GlobalController gController = Get.find<GlobalController>();

  DetailedSpecificationController detailedSpecificationController =
      Get.find<DetailedSpecificationController>();

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

                  // Email Address Input
                  TextField(
                    controller: controller.emailtextEditingController,
                    decoration: const InputDecoration(
                      focusColor: btnColor,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: btnColor, width: 1.2)),
                      border: OutlineInputBorder(),
                      labelText: 'Enter Email Address',
                    ),
                    onChanged: (value) {
                      controller.emailAddress.value = value;
                    },
                  ),

                  SizedBox(height: 20.h),

                  //User Name Input
                  TextField(
                    controller: controller.nametextEditingController,
                    decoration: const InputDecoration(
                      focusColor: btnColor,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: btnColor, width: 1.2)),
                      border: OutlineInputBorder(),
                      labelText: 'Enter Your Name',
                    ),
                    onChanged: (value) {
                      controller.userName.value = value;
                    },
                  ),

                  SizedBox(height: 20.h),

                  // User Address Input
                  TextField(
                    controller: controller.addresstextEditingController,
                    decoration: const InputDecoration(
                      focusColor: btnColor,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: btnColor, width: 1.2)),
                      border: OutlineInputBorder(),
                      labelText: 'Enter Your Address',
                    ),
                    onChanged: (value) {
                      controller.userAddress.value = value;
                    },
                  ),

                  SizedBox(height: 20.h),

                  // Button to proceed (navigate to AR Measurement screen)
                  SizedBox(
                    width: 150.w,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (controller.emailAddress != '' ||
                            controller.userAddress != '' ||
                            controller.userName != '') {
                          gController.addQuoteGenerateData(
                              serviceId: gController.roomSrviceId.value,
                              serviceName: gController.roomServiceName.value,
                              roomName: gController.roomName.value,
                              spAreas:
                                  detailedSpecificationController.selectedAreas,
                              addOnsOption:
                                  detailedSpecificationController.addonsAreas,
                              totalPrice: detailedSpecificationController
                                  .totalPrice
                                  .toString(),
                              email: controller.emailAddress.value,
                              name: controller.userName.value,
                              address: controller.userAddress.value);

                          print(jsonEncode(gController.finalQuoteData));

                          bool isSuccess = await controller.QuoteInfoSubmit();
                          if (isSuccess) {
                            AppUtils.successToast(
                                message: controller.errorMessage);
                            Get.toNamed(
                              RoutesNames.invoiceScreen,
                            );
                          } else {
                            AppUtils.errorToast(
                                message: controller.errorMessage);
                          }
                          controller.emailtextEditingController.clear();
                          controller.nametextEditingController.clear();
                          controller.addresstextEditingController.clear();
                        } else {
                          Get.snackbar(
                            'Incomplete Selection',
                            'Please fill-up required fields before generate quote.',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: btnColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.w, vertical: 15.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Obx(
                        () => controller.isLoading == true
                            ? const CircularProgressIndicator()
                            : Row(
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
