import 'package:better_painting/data/models/service_response_model/service_details_model.dart';

class ServiceResponse {
  String? status;
  int? statusCode;
  String? message;
  List<ServiceDetails>? details;

  ServiceResponse({
     this.status,
     this.statusCode,
     this.message,
     this.details,
  });

  // Factory constructor to create an instance from JSON
  factory ServiceResponse.fromJson(Map<String, dynamic> json) {
    return ServiceResponse(
      status: json['status'],
      statusCode: json['status_code'],
      message: json['message'],
      details: List<ServiceDetails>.from(
        json['details'].map((item) => ServiceDetails.fromJson(item)),
      ),
    );
  }

  // Method to convert object to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'status_code': statusCode,
      'message': message,
      'details': details?.map((item) => item.toJson()).toList(),
    };
  }
}


