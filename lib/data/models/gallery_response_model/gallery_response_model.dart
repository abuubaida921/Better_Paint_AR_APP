import 'gallery_details_model.dart';

class GalleryResponseModel {
  String? status;
  int? statusCode;
  String? message;
  List<GalleryDetailsModel>? details;

  GalleryResponseModel({
     this.status,
     this.statusCode,
     this.message,
     this.details,
  });

  // Factory constructor to create an instance from JSON
  factory GalleryResponseModel.fromJson(Map<String, dynamic> json) {
    return GalleryResponseModel(
      status: json['status'],
      statusCode: json['status_code'],
      message: json['message'],
      details: List<GalleryDetailsModel>.from(
        json['details'].map((item) => GalleryDetailsModel.fromJson(item)),
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


