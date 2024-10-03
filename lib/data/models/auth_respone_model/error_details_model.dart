class ErrorDetail {
  String? field;
  String? message;

  ErrorDetail({
    this.field,
    this.message,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      field: json['field'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'field': field,
      'message': message,
    };
  }
}
