class ServiceDetails {
  int id;
  String createdAt;
  String updatedAt;
  bool isActive;
  String name;
  String description;

  ServiceDetails({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.name,
    required this.description,
  });

  // Factory constructor to create an instance from JSON
  factory ServiceDetails.fromJson(Map<String, dynamic> json) {
    return ServiceDetails(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isActive: json['is_active'],
      name: json['name'],
      description: json['description'],
    );
  }

  // Method to convert object to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'is_active': isActive,
      'name': name,
      'description': description,
    };
  }
}