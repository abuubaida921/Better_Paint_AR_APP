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
        addOnsdetails!.add(new AddOnsDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.addOnsdetails != null) {
      data['details'] = this.addOnsdetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

