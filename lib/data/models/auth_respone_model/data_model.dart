import 'package:better_painting/data/models/auth_respone_model/user_info_model.dart';

class Data {
  UserInfoModel? user;
  String? refresh;
  String? access;

  Data({
    this.user,
    this.refresh,
    this.access,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: json['user'] != null ? UserInfoModel.fromJson(json['user']) : null,
      refresh: json['refresh'],
      access: json['access'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'refresh': refresh,
      'access': access,
    };
  }
}