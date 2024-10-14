import 'package:better_painting/core/utils/utility/Shared%20Preferences/app_stored_data.dart';
import 'package:better_painting/main.dart';
import 'package:better_painting/modules/user_profile_screen/controller/user_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserProfileView extends GetView<UserProfileController> {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                      Get.back();
                      },
                      icon: const CircleAvatar(
                          backgroundColor: btnColor,
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ))),
                  Text(
                    'Profile',
                    style: TextStyle(
                        fontSize: 24.sp,
                        color: btnColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 50.w,
                  )
                ],
              ),
              Column(
                children: [
                  Stack(
          children: [
            Obx(() {
              return Container(
                height: 140,
                width: 140,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    backgroundImage: controller.imageFile.value != null
                        ? FileImage(controller.imageFile.value!)
                        : null,
                    child: controller.imageFile.value == null
                        ? const Text(
                            'S',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          )
                        : null,
                  ),
                ),
              );
            }),
            Positioned(
              bottom: 0, // Align to the bottom
              right: 0, // Align to the right
              child: IconButton(
                onPressed: () {
                  controller.pickImage(); // Open gallery to pick image
                },
                icon: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.edit, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "${AppStoredData.userprofileData!.firstName} ${AppStoredData.userprofileData!.lastName}",
                    style: TextStyle(
                        fontSize: 28.sp,
                        color: btnColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    custome_userProfile_tile(
                      title: '${AppStoredData.userprofileData!.firstName} ${AppStoredData.userprofileData!.lastName}',
                      leadingIcon: Icons.person,
                      trailingIcon: Icons.edit_square,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    custome_userProfile_tile(
                      title: '${AppStoredData.userprofileData!.email}',
                      leadingIcon: Icons.email,
                      trailingIcon: Icons.edit_square,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    custome_userProfile_tile(
                      title: '********',
                      leadingIcon: Icons.lock,
                      trailingIcon: Icons.edit_square,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    custome_userProfile_tile(
                      title: 'Support',
                      leadingIcon: Icons.support_agent_outlined,
                      trailingIcon: Icons.edit_square,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    custome_userProfile_tile(
                      title: 'Sent us an e-mail',
                      leadingIcon: Icons.person,
                      trailingIcon: Icons.edit_square,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    custome_userProfile_tile(
                      title: 'invoice',
                      leadingIcon: Icons.receipt_rounded,
                      trailingIcon: Icons.edit_square,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    custome_userProfile_tile(
                      title: 'logout',
                      leadingIcon: Icons.logout_outlined,
                      onTap: () {
                        AppStoredData.userLogOut();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class custome_userProfile_tile extends StatelessWidget {
  String title;
  IconData? leadingIcon;
  IconData? trailingIcon;
  void Function()? onTap;
  custome_userProfile_tile(
      {super.key, required this.title, this.leadingIcon, this.trailingIcon, void Function()? onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.r))),
        color: Colors.teal.shade50,
        child: ListTile(
          leading: Icon(
            leadingIcon,
            color: btnColor,
          ),
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 18, color: btnColor, fontWeight: FontWeight.w500),
          ),
          trailing: Icon(
            trailingIcon,
            color: btnColor,
          ),
        ),
      ),
    );
  }
}
