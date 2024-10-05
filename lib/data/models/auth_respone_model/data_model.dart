import 'package:better_painting/data/models/auth_respone_model/user_info_model.dart';

class Data {
  UserInfoModel? user;
  String? refresh;
  String? access;
  String? token;

  Data({
    this.user,
    this.refresh,
    this.access,
    this.token
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: json['user'] != null ? UserInfoModel.fromJson(json['user']) : null,
      refresh: json['refresh'],
      access: json['access'],
      token: json['token']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'refresh': refresh,
      'access': access,
      'token' : token
    };
  }
}