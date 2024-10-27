import 'package:better_painting/data/models/addons_respone_model/addons_details_model.dart';

class AddOnsResponseModel {
  String? status;
  int? statusCode;
  String? message;
  List<AddOnsDetails>? addOnsdetails;

  AddOnsResponseModel(
      {this.status, this.statusCode, this.message, this.addOnsdetails});

  AddOnsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['details'] != null) {
      addOnsdetails = <AddOnsDetails>[];
      json['details'].forEach((v) {
        addOnsdetails!.add(AddOnsDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    data['message'] = message;
    if (addOnsdetails != null) {
      data['details'] = addOnsdetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

