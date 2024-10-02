// Create Account Screen //
import 'package:better_painting/main.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                      'Email Address',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(backgroundColor),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: 'Plese Enter Your Email',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none)),
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
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: 'Plese Enter Your Password',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none)),
                  ),
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
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: 'Plese Enter Your Password',
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none)),
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
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            )),
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
    );
  }
}