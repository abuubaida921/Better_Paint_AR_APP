class AddOnsDetails {
  int? id;
  String? createdAt;
  String? updatedAt;
  bool? isActive;
  String? name;
  String? description;
  String? pricePerUnit;
  String? unitType;

  AddOnsDetails(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.isActive,
      this.name,
      this.description,
      this.pricePerUnit,
      this.unitType});

  AddOnsDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['is_active'];
    name = json['name'];
    description = json['description'];
    pricePerUnit = json['price_per_unit'];
    unitType = json['unit_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_active'] = isActive;
    data['name'] = name;
    data['description'] = description;
    data['price_per_unit'] = pricePerUnit;
    data['unit_type'] = unitType;
    return data;
  }
}