import 'package:better_painting/data/models/specification_response_model/specification_details.dart';

class SpecificationResponeModel {
  String? status;
  int? statusCode;
  String? message;
  List<SpecificationDetails>? specificationdetails;

  SpecificationResponeModel(
      {this.status, this.statusCode, this.message, this.specificationdetails});

  SpecificationResponeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['details'] != null) {
      specificationdetails = <SpecificationDetails>[];
      json['details'].forEach((v) {
        specificationdetails!.add(SpecificationDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    data['message'] = message;
    if (specificationdetails != null) {
      data['details'] = specificationdetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

