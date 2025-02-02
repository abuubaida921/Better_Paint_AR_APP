class QuoteInvoiceResponseModel {
  QuoteInvoiceResponseModel({
      this.status, 
      this.statusCode, 
      this.message, 
      this.details,});

  QuoteInvoiceResponseModel.fromJson(dynamic json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    details = json['details'] != null ? Details.fromJson(json['details']) : null;
  }
  String? status;
  num? statusCode;
  String? message;
  Details? details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_code'] = statusCode;
    map['message'] = message;
    if (details != null) {
      map['details'] = details?.toJson();
    }
    return map;
  }

}

class Details {
  Details({
      this.rooms, 
      this.customer,});

  Details.fromJson(dynamic json) {
    if (json['rooms'] != null) {
      rooms = [];
      json['rooms'].forEach((v) {
        rooms?.add(Rooms.fromJson(v));
      });
    }
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }
  List<Rooms>? rooms;
  Customer? customer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (rooms != null) {
      map['rooms'] = rooms?.map((v) => v.toJson()).toList();
    }
    if (customer != null) {
      map['customer'] = customer?.toJson();
    }
    return map;
  }

}

class Customer {
  Customer({
      this.email, 
      this.name, 
      this.address,});

  Customer.fromJson(dynamic json) {
    email = json['email'];
    name = json['name'];
    address = json['address'];
  }
  String? email;
  String? name;
  String? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['name'] = name;
    map['address'] = address;
    return map;
  }

}

class Rooms {
  Rooms({
    this.service,
    this.quoteRoomName,
    this.specificationOfAreas,
    this.addOns,
    this.totalPrice,
    this.quote,});

  Rooms.fromJson(dynamic json) {
    service = json['service'] != null ? Service.fromJson(json['service']) : null;
    quoteRoomName = json['quote_room_name'];
    specificationOfAreas = json['specification_of_areas'] != null ? json['specification_of_areas'].cast<num>() : [];
    addOns = json['add_ons'] != null ? json['add_ons'].cast<num>() : [];
    totalPrice = json['total_price'];
    quote = json['quote'];
  }
  Service? service;
  String? quoteRoomName;
  List<num>? specificationOfAreas;
  List<num>? addOns;
  String? totalPrice;
  num? quote;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (service != null) {
      map['service'] = service?.toJson();
    }
    map['quote_room_name'] = quoteRoomName;
    map['specification_of_areas'] = specificationOfAreas;
    map['add_ons'] = addOns;
    map['total_price'] = totalPrice;
    map['quote'] = quote;
    return map;
  }

}

class Service {
  Service({
    this.id,
    this.serviceName,});

  Service.fromJson(dynamic json) {
    id = json['id'];
    serviceName = json['service_name'];
  }
  String? id;
  String? serviceName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['service_name'] = serviceName;
    return map;
  }

}