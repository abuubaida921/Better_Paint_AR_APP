import 'dart:convert';
import 'dart:developer';

import 'package:better_painting/core/utils/constants/app_url.dart';
import 'package:better_painting/data/models/response_model/response_model.dart';
import 'package:better_painting/dependency/global%20dependency/global_controller.dart';
import 'package:better_painting/services/netwrok_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';

import '../../../data/models/quote_generation_model/quote_invoice_response_model.dart';
import 'package:http/http.dart' as http;

class QuoteGenerateController extends GetxController {
  // Create a TextEditingController to manage the text
  late TextEditingController emailtextEditingController;
  late TextEditingController nametextEditingController;
  late TextEditingController addresstextEditingController;

  // To store room name
  RxString emailAddress = ''.obs;
  RxString userName = ''.obs;
  RxString userAddress = ''.obs;
  final finalAmountToPay =0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailtextEditingController = TextEditingController();
    nametextEditingController = TextEditingController();
    addresstextEditingController = TextEditingController();
  }

  // Sign Up loading indicator //
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;

  // Response success or error message //
  final _errorMessage = ''.obs; // Corrected declaration as RxString
  get errorMessage => _errorMessage.value;

  QuoteInvoiceResponseModel _quoteInvoiceResponseModel = QuoteInvoiceResponseModel();
  QuoteInvoiceResponseModel get quoteInvoiceResponseModel => _quoteInvoiceResponseModel;

  // Quote Generate Request //
 Future<bool> quoteInfoSubmit() async {
 
  try {
    if (await GlobalController().checkInternetConnectivity()) {
      _isLoading.value = true;

      final ResponseModel response = await NetworkCaller().postRequest(
        AppUrl.quotationGenerate,
        Get.find<GlobalController>().finalQuoteData,
      );

      if (kDebugMode) {
        print('jsonEncode(response.responseData)');
        print(jsonEncode(response.responseData));
      }

      if (response.isSuccess == 'success') {
        if (response.statusCode == 201) {
        _errorMessage.value = response.errorMessage;
        _quoteInvoiceResponseModel=QuoteInvoiceResponseModel.fromJson(response.responseData);
          return true;
        } else {
          log("Unexpected successful response status code: ${response.statusCode}");
          return false;
        }
      } else {
        if (response.statusCode == 404) {
           _errorMessage.value = response.errorMessage;
        } else {
           _errorMessage.value = response.errorMessage;
        }
        return false;
      }
    } else {
      _errorMessage.value = "No internet connection.";
    }
  } catch (ex) {
    log("An error occurred: ${ex.toString()}");
    _errorMessage.value = "An unexpected error occurred. Please try again.";
    return false;
  } finally {
    _isLoading.value = false;
  }
  return false;
}

Future<void> makePayment(BuildContext context)async{
  try{
    final paymentIntentData = await createPaymentIntent('${finalAmountToPay.value.toStringAsFixed(2)}', 'USD')??{};
    await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentIntentData['client_secret'],
      style: ThemeMode.light,
      customFlow: false,
      merchantDisplayName: 'Better Paint'
    ),).then((value){
      displayPaymentSheet(context);
    });
  }catch(err){
    if(kDebugMode){
      print(err);
    }
  }
}
dynamic createPaymentIntent(String amount, String currency) async{
   try{
     final body={
       'amount':amount,
       'currency':currency,
     };
     final response = await http.post(
       Uri.parse(AppUrl.paymentUrl),
       body:body,
       headers: {'Content-Type':'application/x-www-form-urlencoded'});
     return jsonDecode(response.body);
   }catch(err){
     if(kDebugMode){
       print(err);
     }
   }
}
void displayPaymentSheet(BuildContext context)async{
   try{

     await Stripe.instance.presentPaymentSheet().then((value){
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Paid Successfully')));
     }).onError((err, stackTrace){
       throw Exception(err);
     });
   }on StripeException catch(e){
     if(kDebugMode){
       print('Error is in payment ------> $e');
     }
   }
}
}
