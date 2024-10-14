import 'package:better_painting/data/models/auth_respone_model/data_model.dart';
import 'package:better_painting/data/models/auth_respone_model/error_details_model.dart';

class AuthResponseModel {
  String? status;
  int? statusCode;
  String? message;
  Data? userData;
  ErrorDetail? errorDetails;

  AuthResponseModel({
    this.status,
    this.statusCode,
    this.message,
    this.userData,
    this.errorDetails,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
  return AuthResponseModel(
    status: json['status'],
    statusCode: json['status_code'],
    message: json['message'],
    userData: (json['details'] != null && json['details'] is Map<String, dynamic>)
        ? Data.fromJson(json['details'])
        : null, // Handle userData only if it's a Success Response
    errorDetails: (json['details'] != null && json['details'] is Map<String, dynamic>)
        ? ErrorDetail.fromJson(json['details'])
        : null, // Handle errorDetails only if it's a Error Respone
  );
}


}
