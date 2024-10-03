import 'package:better_painting/modules/ar_home_screen/view/ar_home_view.dart';
import 'package:better_painting/modules/ar_measurement_screen/view/ar_measurement_view.dart';
import 'package:better_painting/modules/auth_screens/signin_or_signup_screen/view/singin_or_siginup_view.dart';
import 'package:better_painting/modules/auth_screens/signin_screen/view/signin_view.dart';
import 'package:better_painting/modules/auth_screens/signup_screen/view/signup_view.dart';
import 'package:better_painting/modules/detailed_specification_screen/view/detailed_specification_view.dart';
import 'package:better_painting/modules/invoice_screen/view/invoice.dart';
import 'package:better_painting/modules/pick_image_screen/view/pick_image_view.dart';
import 'package:better_painting/modules/quote_summary_screen/view/quote_summary_view.dart';
import 'package:better_painting/modules/service_selection_screen/view/service_selection_view.dart';
import 'package:better_painting/modules/splash_screen/view/splash_view.dart';
import 'package:better_painting/routes/routes_names.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: RoutesNames.splashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: RoutesNames.signInScreen,
    page: () => const SignInScreen(),
  ),
  GetPage(
    name: RoutesNames.signUpScreen,
    page: () =>  SignupView(),
  ),
  GetPage(
    name: RoutesNames.signinOrSignUpScreen,
    page: () => const SinginOrSiginupView(),
  ),
  GetPage(
    name: RoutesNames.arHomeScreen,
    page: () => const ARHomePage(),
  ),
  GetPage(
    name: RoutesNames.serviceSelectionScreen,
    page: () => const ServiceSelectionScreen(),
  ),
  GetPage(
    name: RoutesNames.arMeasurementScreen,
    page: () => const ARMeasurementScreen(),
  ),
  GetPage(
    name: RoutesNames.pickIamgeScreen,
    page: () => const PickImageScreen(),
  ),
  GetPage(
    name: RoutesNames.detailedSpecificationScreen,
    page: () => const DetailedSpecificationScreen(),
  ),
  GetPage(
    name: RoutesNames.quoteSummaryScreen,
    page: () => const QuoteSummaryScreen(),
  ),
  GetPage(
    name: RoutesNames.invoiceScreen,
    page: () => InvoiceScreen(),
  ),
];
