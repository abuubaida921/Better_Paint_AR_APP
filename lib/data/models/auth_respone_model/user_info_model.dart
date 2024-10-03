class UserInfoModel {
  String? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;

  UserInfoModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email,
    };
  }
}
