import 'package:better_painting/dependency/global%20dependency/global_bindings.dart';
import 'package:better_painting/routes/routes_names.dart';
import 'package:better_painting/routes/routes_screens.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

const int primaryColor = 0xFFB22331; // Base color #b22331
const int blackColor = 0xFF252525;
const int backgroundColor = 0xFF052138;
const Color btnColor = Color.fromARGB(255, 15, 46, 74); // Base color #b22331
const Color baseColor = Color(backgroundColor); // Base color #b22331

Map<int, Color> colorSwatch = {
  50: const Color(0xFFFDE8E9),
  100: const Color(0xFFF9C5C8),
  200: const Color(0xFFF59FA3),
  300: const Color(0xFFEF787E),
  400: const Color(0xFFEA5A62),
  500: const Color(primaryColor), // Primary shade (#b22331)
  600: const Color(0xFFA71F2C),
  700: const Color(0xFF931B25),
  800: const Color(0xFF7F1720),
  900: const Color(0xFF611116),
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
  runApp(const ARApp());
}

class ARApp extends StatelessWidget {
  const ARApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    // Responsive height width
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ScreenUtilInit(
      designSize: Size(screenWidth, screenHeight),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BetterPainting AR Quote App',
        theme: ThemeData(
          primarySwatch: customSwatch,
          fontFamily: 'Roboto',
        ),
        initialRoute: RoutesNames.splashScreen,
        getPages: routes,
        initialBinding: GlobalBindings(),
      ),
    );
  }
}
