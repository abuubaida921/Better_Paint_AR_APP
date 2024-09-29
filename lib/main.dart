import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'invoice.dart';

const int primaryColor = 0xFFB22331; // Base color #b22331
const int blackColor = 0xFF252525;
const int backgroundColor = 0xFF052138;
const Color btnColor = Color.fromARGB(255, 15, 46, 74); // Base color #b22331
const Color baseColor = Color(backgroundColor); // Base color #b22331

Map<int, Color> colorSwatch = {
  50: Color(0xFFFDE8E9),
  100: Color(0xFFF9C5C8),
  200: Color(0xFFF59FA3),
  300: Color(0xFFEF787E),
  400: Color(0xFFEA5A62),
  500: Color(primaryColor), // Primary shade (#b22331)
  600: Color(0xFFA71F2C),
  700: Color(0xFF931B25),
  800: Color(0xFF7F1720),
  900: Color(0xFF611116),
};

// Create a MaterialColor from the swatch
MaterialColor customSwatch = MaterialColor(primaryColor, colorSwatch);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(ARApp());
}

class ARApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BetterPainting AR Quote App',
      theme: ThemeData(
        primarySwatch: customSwatch,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/splash',
      routes: {
        '/': (context) => ARHomePage(),
        '/splash': (context) => SplashScreen(),
        '/accountOnboding': (conext) => AccountOnbondig(),
        '/signInScreen': (conext) => SignInScreen(),
        '/createAccountScreen': (conext) => CreateAccountScreen(),
        '/serviceSelection': (context) => ServiceSelectionScreen(),
        '/detailedSpecification': (context) => DetailedSpecificationScreen(),
        '/arMeasurement': (context) => ARMeasurementScreen(),
        '/quoteSummary': (context) => QuoteSummaryScreen(),
        '/invoice': (context) => InvoiceScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to ARHomePage after a delay
    Timer(Duration(seconds: 3), () {
      Get.offAllNamed('/');
    });
  }

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

class ARHomePage extends StatelessWidget {
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
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
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

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset(
            'assets/images/logo_horizontal_fullcolor.png',
            height: 150,
            width: double.infinity,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Welcome to Better Painting AR Experience',
            style: TextStyle(
              color: Color(backgroundColor),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Discover our augmented reality services to enhance your world with digital experiences.',
            style: TextStyle(
              color: Color(backgroundColor),
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 40),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/accountOnboding');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: btnColor,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Start Your Quote',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}

class ServiceSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop(false);
      //       },
      //       icon: Icon(
      //         CupertinoIcons.back,
      //         color: Colors.black,
      //       )),
      //   title: Text(
      //     'Choose a Service',
      //     style: TextStyle(color: Colors.black,),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildServiceButton(context, 'Interior Painting', Icons.home),
                _buildServiceButton(
                    context, 'Exterior Painting', Icons.landscape),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [baseColor, baseColor],
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //   ),
      // ),
    );
  }

  Widget _buildServiceButton(
      BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, '/detailedSpecification');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        icon: Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
        label: Text(
          title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

class DetailedSpecificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop(false);
      //       },
      //       icon: Icon(
      //         CupertinoIcons.back,
      //         color: Colors.white,
      //       )),
      //   title: Text(
      //     'Specify Details',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   backgroundColor: baseColor,
      //   elevation: 0,
      // ),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Specify Areas to be Painted',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(backgroundColor)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  _buildDetailOption('Walls'),
                  _buildDetailOption('Doors'),
                  _buildDetailOption('Trim'),
                  _buildDetailOption('Ceilings'),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/arMeasurement');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'AR Measurement',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
      decoration: BoxDecoration(color: Colors.white),
    );
  }

  Widget _buildDetailOption(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: Icon(Icons.check_circle, color: Colors.blueAccent),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
      ),
    );
  }
}

class ARMeasurementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var selectedColorIndex = 0.obs;
    List<Color> colorList = [
      Color(0xFF000000), // Black
      // Color(0xFFFFFFFF), // White
      Color(0xFF0000FF), // Blue
      Color(0xFFFF0000), // Red
      Color(0xFF00FF00), // Green
      // Color(0xFF808080), // Gray
      // Color(0xFFFFA500), // Orange
      // Color(0xFFFFFF00), // Yellow
      // Color(0xFF800080), // Purple
      // Color(0xFF00FFFF), // Cyan
      // Color(0xFFFFC0CB), // Pink
      // Color(0xFF008000), // Dark Green
      // Color(0xFFADD8E6), // Light Blue
      // Color(0xFFFF6347), // Tomato
      // Color(0xFF4B0082), // Indigo
      // Color(0xFFFFD700), // Gold
      // Color(0xFF40E0D0), // Turquoise
      // Color(0xFFFA8072), // Salmon
      // Color(0xFFB22222), // Firebrick
      // Color(0xFF4682B4), // Steel Blue
      // Color(0xFFA52A2A), // Brown
      // Color(0xFF2E8B57), // Sea Green
      // Color(0xFF6A5ACD), // Slate Blue
      // Color(0xFFD2691E), // Chocolate
      // Color(0xFFDC143C), // Crimson
      // Color(0xFF4169E1), // Royal Blue
    ];
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop(false);
      //       },
      //       icon: Icon(
      //         CupertinoIcons.back,
      //         color: Colors.white,
      //       )),
      //   title: Text(
      //     'AR Measurement',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   backgroundColor: baseColor,
      //   elevation: 0,
      // ),
      body: Stack(
        children: [
          _buildBackground(),
          Image.asset(
            'assets/images/r_1.png',
            width: Get.width,
            fit: BoxFit.fill,
            height: 350,
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
            () => Positioned(
              top: 360,
              child: Row(
                children: [
                  for (int i = 0; i < colorList.length; i++)
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        selectedColorIndex.value = i;
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 9),
                        height: 28,
                        width: 28,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: selectedColorIndex.value == i
                                    ? Color(primaryColor)
                                    : Colors.transparent),
                            shape: BoxShape.circle),
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: colorList[i], shape: BoxShape.circle),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 380,
                  ),
                  Text(
                    'Home Decor',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(primaryColor)),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 80),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/invoice');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Quote Summary',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
      decoration: BoxDecoration(color: Colors.white),
    );
  }
}

class QuoteSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.of(context).pop(false);
      //       },
      //       icon: Icon(
      //         CupertinoIcons.back,
      //         color: Colors.white,
      //       )),
      //   title: Text(
      //     'Quote Summary',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   backgroundColor: baseColor,
      //   elevation: 0,
      // ),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Quote Summary',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(backgroundColor)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Generate quote or restart process
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Finish',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}

// Account On Bonding Screen //
class AccountOnbondig extends StatelessWidget {
  const AccountOnbondig({super.key});

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
                  Image.asset(
                    'assets/images/paint_cover.png',
                    width: 280,
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        // Generate quote or restart process
                        Navigator.pushNamed(context, '/signInScreen');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(primaryColor),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'CARETE AN ACCOUNT',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        // Generate quote or restart process
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: btnColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'SIGN IN NOW',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          WidgetStateProperty.all<Color>(Colors.grey),
                    ),
                    onPressed: () {},
                    child: Text(
                      'SKIP',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Sign In Account Screen //
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 50,
                          color: Color(backgroundColor),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Align(
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
                        contentPadding: EdgeInsets.all(0),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: 'Plese Enter Your Email',
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
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
                      Text(
                        'Forget Password',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 55,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t you have account? ', style: TextStyle(
                             fontSize: 16),),
                      InkWell(
                        onTap: () {
                        Navigator.pushNamed(context, '/createAccountScreen');
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Color(primaryColor),
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                              ),
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
    );
  }
}

// Create Account Screen //
class CreateAccountScreen  extends StatelessWidget {
  const CreateAccountScreen({super.key});

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
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
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
                      const Text('Have account? ', style: TextStyle(
                             fontSize: 16),),
                      InkWell(
                        onTap: () {
                         
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              color: Color(primaryColor),
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                              ),
                        ),
                      )
                    ],
                  )
                    ],
                  ),
                  const SizedBox(height: 55,),
                 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
