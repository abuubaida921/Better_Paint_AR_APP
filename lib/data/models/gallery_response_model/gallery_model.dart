class GalleryModel {
  int id;
  String createdAt;
  String updatedAt;
  bool isActive;
  String image;
  int category;

  GalleryModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.image,
    required this.category,
  });

  // Factory constructor to create an instance from JSON
  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    return GalleryModel(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isActive: json['is_active'],
      image: json['image'],
      category: json['category'],
    );
  }

  // Method to convert object to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'is_active': isActive,
      'image': image,
      'category': category,
    };
  }
}