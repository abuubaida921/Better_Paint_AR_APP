import 'package:better_painting/data/models/auth_respone_model/data_model.dart';
import 'package:better_painting/data/models/auth_respone_model/error_details_model.dart';

class AuthResponseModel {
  String? status;
  int? statusCode;
  String? message;
  Data? data;
  List<ErrorDetail>? details;

  AuthResponseModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
    this.details,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      status: json['status'],
      statusCode: json['status_code'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      details: json['details'] != null
          ? List<ErrorDetail>.from(json['details'].map((x) => ErrorDetail.fromJson(x)))
          : null,
    );
  }

  
}