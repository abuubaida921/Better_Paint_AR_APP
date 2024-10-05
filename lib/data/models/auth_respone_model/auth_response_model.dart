import 'package:better_painting/data/models/auth_respone_model/error_details_model.dart';
import 'package:better_painting/data/models/auth_respone_model/user_info_model.dart';

class AuthResponseModel {
  String? status;
  int? statusCode;
  String? message;
  UserInfoModel? userDetails;
  List<ErrorDetail>? errorDetails;

  AuthResponseModel({
    this.status,
    this.statusCode,
    this.message,
    this.userDetails,
    this.errorDetails,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      status: json['status'],
      statusCode: json['status_code'],
      message: json['message'],
      userDetails: json['details'] != null && json['details'] is Map<String, dynamic>
          ? UserInfoModel.fromJson(json['details'])
          : null, // Handle userDetails only if it's a map
      errorDetails: json['details'] != null && json['details'] is List
          ? List<ErrorDetail>.from(json['details'].map((x) => ErrorDetail.fromJson(x)))
          : null, // Handle errorDetails only if it's a list
    );
  }
}
