import 'gallery_model.dart';

class GalleryDetailsModel {
  int id;
  String createdAt;
  String updatedAt;
  bool isActive;
  String name;
  List<GalleryModel>? galleryModel;

  GalleryDetailsModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.name,
    required this.galleryModel,
  });

  // Factory constructor to create an instance from JSON
  factory GalleryDetailsModel.fromJson(Map<String, dynamic> json) {
    return GalleryDetailsModel(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isActive: json['is_active'],
      name: json['name'],
      galleryModel: List<GalleryModel>.from(
      json['gallery'].map((item) => GalleryModel.fromJson(item)),
    ),
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
      'gallery': galleryModel,
    };
  }
}