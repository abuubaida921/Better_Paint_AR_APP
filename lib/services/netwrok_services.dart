import 'dart:convert';

import 'package:better_painting/core/utils/constants/error_string.dart';
import 'package:better_painting/core/utils/utility/app_utils.dart';
import 'package:http/http.dart' as http;

import '../data/models/response_model/response_model.dart';

class NetworkCaller {
  static const int timeoutRequest = 60;

  final Map<String, String> _mainHeaders = {
    'Content-Type': 'application/json',
    'Vary': 'Accept',
  };

  //Get current user header
  static Map<String, String> currentUserHeader({String? token}) {
    Map<String, String> mainHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Vary': 'Accept',
      'Authorization': 'Bearer $token',
    };
    return mainHeaders;
  }

  // Get Request with _mainHeaders //
  Future<ResponseModel> getRequest(String url, {String? token}) async {
    final http.Response response =
        await http.get(Uri.parse(url), headers: _mainHeaders).timeout(
      const Duration(seconds: timeoutRequest),
      onTimeout: () {
        return http.Response(addedErrorMessage(), 504);
      },
    );
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      if (decodedResponse != null) {
        return ResponseModel(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedResponse,
        );
      } else if (response.statusCode == 401) {
        return ResponseModel(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: decodedResponse ?? ErrorStrings.someErrorMessage,
            errorMessage: ErrorStrings.unauthorizedUserErrorMessage);
      } else if (response.statusCode == 500) {
        return ResponseModel(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: decodedResponse ?? ErrorStrings.someErrorMessage,
            errorMessage: ErrorStrings.serverErrorMessage);
      } else {
        return ResponseModel(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: decodedResponse ?? 'Something went Wrong');
      }
    } else {
      return ResponseModel(
          isSuccess: false, statusCode: response.statusCode, responseData: {});
    }
  }

  // post Request With currentUserHeader //
  Future<ResponseModel> postRequest(String url, Map<String, dynamic> body,
      {String? token}) async {
    final http.Response response = await http
        .post(Uri.parse(url),
            headers:
                token == null ? _mainHeaders : currentUserHeader(token: token),
            body: jsonEncode(body))
        .timeout(
      const Duration(seconds: timeoutRequest),
      onTimeout: () {
        return http.Response(ErrorStrings.kServerTimeoutMessage, 504);
      },
    );

    // Handling the response
    final decodedResponse = jsonDecode(response.body);

    if (decodedResponse['status_code'] == 200 ||
        decodedResponse['status_code'] == 201) {
      return ResponseModel(
        isSuccess: true,
        statusCode: decodedResponse['status_code'],
        responseData: decodedResponse, // Assign decoded JSON to responseData
        errorMessage: decodedResponse[
            'message'], // No error message in successful response
      );
    } else if (decodedResponse['status_code'] == 401) {
      return ResponseModel(
        isSuccess: false,
        statusCode: decodedResponse['status_code'],
        responseData: decodedResponse,
        errorMessage: decodedResponse['message'] ??
            'Unauthorized', // Assign specific error message
      );
    } else if (decodedResponse['status_code'] == 400) {
      return ResponseModel(
        isSuccess: false,
        statusCode: decodedResponse['status_code'],
        responseData: decodedResponse,
        errorMessage: decodedResponse['message'] ??
            'Error', // Assign specific error message
      );
    } else if (decodedResponse['status_code'] == 500) {
      return ResponseModel(
        isSuccess: false,
        statusCode: decodedResponse['status_code'],
        responseData: decodedResponse,
        errorMessage: decodedResponse['message'] ??
            'Internal Server Error', // Specific message
      );
    } else {
      return ResponseModel(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: decodedResponse,
        errorMessage: decodedResponse['message'] ??
            'Unknown error occurred', // Handle other error cases
      );
    }
  }
}
