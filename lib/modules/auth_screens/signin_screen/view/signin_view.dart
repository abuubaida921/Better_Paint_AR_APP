// Sign In Account Screen //
import 'package:better_painting/core/utils/constants/error_string.dart';
import 'package:better_painting/core/utils/utility/app_utils.dart';
import 'package:better_painting/main.dart';
import 'package:better_painting/modules/auth_screens/signin_screen/controller/signin_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../routes/routes_names.dart';

class SignInScreen extends GetView<SigninViewController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final signInController = Get.put(SigninViewController(), permanent: true);

    return Scaffold(
     resizeToAvoidBottomInset: false,
      body: Form(
        key: controller.singInFormKeyGlobal,
        child: Stack(
          children: [
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
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 50,
                            color: Color(backgroundColor),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Sign in your register account',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(primaryColor),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                     SizedBox(
                      height: 40.h,
                    ),
                    const Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Email Address',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(backgroundColor),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextFormField(
                      controller: controller.emailTextEditingController,
                      decoration: InputDecoration(
                          contentPadding:  EdgeInsets.only(left: 5.w),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          hintText: 'Plese Enter Your Email',
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                      validator: (value) {
                        var email = value;
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email!);

                        if (value == null ||
                            value.isEmpty ||
                            emailValid == false) {
                          return 'Please enter your valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(backgroundColor),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Obx(
                      () {
                        return TextFormField(
                           obscureText: controller.passwordVisibility.value,
                            controller:
                                controller.passwordTextEditingController,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller
                                        .togglePasswordvisibility(); // Toggle password visibility
                                  },
                                  icon: Icon(
                                    controller.passwordVisibility.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                contentPadding:  EdgeInsets.only(left: 5.w),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                hintText: 'Plese Enter Your Password',
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.trim().length < 8) {
                                return ErrorStrings.minimumLargePasswordLength;
                              } else {
                                return null;
                              }
                            });
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: btnColor,
                          child: IconButton(
                              onPressed: () async {
                                if (controller.singInFormKeyGlobal.currentState!
                                    .validate()) {
                                  bool isSuccess =
                                      await controller.userSignInFormSubmit();
                                  if (isSuccess) {
                                    Get.offAllNamed(RoutesNames.arHomeScreen);
                                    AppUtils.successToast(
                                        message: controller.errorMessage);
                                  } else {
                                    AppUtils.errorToast(
                                        message: controller.errorMessage);
                                  }
                                }
                              },
                              icon: Obx(
                                () => controller.isLoading == true
                                    ? const Center(
                                        child: CircularProgressIndicator(color: Colors.white,))
                                    : const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                      ),
                              )),
                        ),
                        Text(
                          'Forget Password',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t you have account? ',
                          style: TextStyle(fontSize: 16),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(RoutesNames.signUpScreen);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Color(primaryColor),
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
