// Create Account Screen //
import 'package:better_painting/core/utils/constants/error_string.dart';
import 'package:better_painting/core/utils/utility/app_utils.dart';
import 'package:better_painting/main.dart';
import 'package:better_painting/modules/auth_screens/signup_screen/controller/signup_controller.dart';
import 'package:better_painting/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupView extends GetView<SignUpController> {
   SignupView({super.key});

  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.signUpFormKeyGlobal,
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
                          'Create Account',
                          style: TextStyle(
                              fontSize: 50,
                              color: Color(backgroundColor),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          'Register with valid e-mail address',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(primaryColor),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          'First Name',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(backgroundColor),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      TextFormField(
                        controller: signUpController.firstNameTextEditingController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: 'Plese Enter Your First Name',
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your First name';
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
                          'Last Name',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(backgroundColor),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      TextFormField(
                      controller: signUpController.lastNameTextEditingController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: 'Plese Enter Your Last Name',
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Last name';
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
                          'Phone Number',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(backgroundColor),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      TextFormField(
                      controller: signUpController.phoneTextEditingController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: 'Plese Enter Your Phone Number',
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Phone Number';
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
                          'Email Address',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(backgroundColor),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      TextFormField(
                      controller: signUpController.emailTextEditingController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(0),
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
                      TextFormField(
                      controller: signUpController.passwordTextEditingController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(0),
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
                            } else if (controller
                                    .passwordTextEditingController.text !=
                                controller.cPasswordTextEditingController.text) {
                              return 'Passwords do not match. Please try again.';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          'Confirm Password',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(backgroundColor),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      TextFormField(
                      controller: signUpController.cPasswordTextEditingController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(0),
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
                            } else if (controller
                                    .passwordTextEditingController.text !=
                                controller.cPasswordTextEditingController.text) {
                              return 'Passwords do not match. Please try again.';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: btnColor,
                            child: Obx(
                            () => signUpController.isLoading == true ? const Center(child:  CircularProgressIndicator()) :
                               IconButton(
                                  onPressed: () async {
                                    if (controller.signUpFormKeyGlobal.currentState!
                                        .validate()) {
                                      bool isSuccess =
                                          await controller.userSignUpFormSubmit();
                                      if (isSuccess) {
                                        Get.toNamed(RoutesNames.signInScreen);
                                        AppUtils.successToast(message: signUpController.errorMessage);
                                      } else {
                                         AppUtils.errorToast(message: signUpController.errorMessage);
                                      }
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Have account? ',
                                style: TextStyle(fontSize: 16),
                              ),
                              InkWell(
                                onTap: () {},
                                child: const Text(
                                  'Sign In',
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
                      const SizedBox(
                        height: 55,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
