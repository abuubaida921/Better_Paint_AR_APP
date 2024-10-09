import 'package:better_painting/modules/service_selection_screen/controller/service_selection_controller.dart';
import 'package:better_painting/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../main.dart';

class ServiceSelectionScreen extends GetView<ServiceSelectionController> {
  const ServiceSelectionScreen({super.key});

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
          Obx(
            () => controller.isLoading
                ? const SizedBox(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Color(primaryColor),
                    )),
                  )
                : Center(
                    child: SizedBox(
                      width: 250.h,
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var items =
                                controller.serviceResponse.details![index];
                            return _buildServiceButton(
                              context,
                              items.name,
                              items.name == 'Interior'
                                  ? Icons.home
                                  : Icons.landscape,
                              onPressed: () {
                                Get.toNamed(
                                    RoutesNames.roomSelectionScreen,
                                    arguments: {
                                      'serviceName': items.name,
                                      'serviceId': items.id
                                    });
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 5,
                            );
                          },
                          itemCount:
                              controller.serviceResponse.details?.length ?? 0),
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
      {void Function()? onPressed}) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          padding:  EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        icon: Icon(
          icon,
          size: 30.h,
          color: Colors.white,
        ),
        label: Text(
          title,
          style:  TextStyle(
              fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
