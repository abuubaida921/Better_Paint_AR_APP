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
        specificationdetails!.add(new SpecificationDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.specificationdetails != null) {
      data['details'] = this.specificationdetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

