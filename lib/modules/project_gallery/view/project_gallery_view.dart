import 'package:better_painting/dependency/global%20dependency/global_controller.dart';
import 'package:better_painting/main.dart';
import 'package:better_painting/modules/quote_generate_email/controller/quote_generate_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/project_gallery_controller.dart';

class ProjectGalleryView extends GetView<ProjectGalleryController> {
  ProjectGalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(()=>Stack(
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Project gallery',
                    style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(backgroundColor)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.setButtonIndex(0);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: controller.selectedButtonIndex.value==0?selectedBtnColor:btnColor,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'All',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.setButtonIndex(1);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: controller.selectedButtonIndex.value==1?selectedBtnColor:btnColor,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Interior',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.setButtonIndex(2);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: controller.selectedButtonIndex.value==2?selectedBtnColor:btnColor,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Exterior',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.setButtonIndex(3);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: controller.selectedButtonIndex.value==3?selectedBtnColor:btnColor,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Cabinets',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  controller.galleryItem.isNotEmpty?
                  GridView.builder(
                    itemCount: controller.galleryItem.length, // List of image URLs or assets
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () => showFullScreenImage(context,controller, index), // Open full-screen popup
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          controller.galleryItem[index].image,
                          fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                              'https://cdn-icons-png.flaticon.com/512/13434/13434972.png',
                              fit: BoxFit.cover);
                        },
                      )));
                    },
                  ):
                  const Center(child: Text('No image available')),

                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
  void showFullScreenImage(BuildContext context, ProjectGalleryController controller, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.black,
              insetPadding: EdgeInsets.zero,
              child: Stack(
                children: [
                  // Zoomable image
                  Center(
                    child: InteractiveViewer(
                      panEnabled: true,
                      minScale: 1,
                      maxScale: 4,
                      child: Image.network(
                        controller.galleryItem[index].image,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 100, color: Colors.grey),
                      ),
                    ),
                  ),

                  // Close button
                  Positioned(
                    top: 40,
                    right: 20,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 30),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  // Left arrow button
                  if (index > 0) // Show only if not first image
                    Positioned(
                      left: 20,
                      top: MediaQuery.of(context).size.height / 2 - 30,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 40),
                        onPressed: () {
                          setState(() {
                            index--; // Move to previous image
                          });
                        },
                      ),
                    ),

                  // Right arrow button
                  if (index < controller.galleryItem.length - 1) // Show only if not last image
                    Positioned(
                      right: 20,
                      top: MediaQuery.of(context).size.height / 2 - 30,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 40),
                        onPressed: () {
                          setState(() {
                            index++; // Move to next image
                          });
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
    );
  }
}
