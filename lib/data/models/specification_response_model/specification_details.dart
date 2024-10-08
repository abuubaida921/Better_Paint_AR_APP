class SpecificationDetails {
  int? id;
  String? createdAt;
  String? updatedAt;
  bool? isActive;
  String? name;
  String? description;
  String? pricePerUnit;
  String? unitType;
  int? service;

  SpecificationDetails(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.isActive,
      this.name,
      this.description,
      this.pricePerUnit,
      this.unitType,
      this.service});

  SpecificationDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['is_active'];
    name = json['name'];
    description = json['description'];
    pricePerUnit = json['price_per_unit'];
    unitType = json['unit_type'];
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_active'] = this.isActive;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price_per_unit'] = this.pricePerUnit;
    data['unit_type'] = this.unitType;
    data['service'] = this.service;
    return data;
  }
}