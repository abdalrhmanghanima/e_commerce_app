import 'package:ecommerce_app/domain/model/category.dart';
class CategoryDto {
  const CategoryDto({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryDto.fromJson(dynamic json) {
    String? parsedCategoryId;

    if (json['category'] != null) {
      final cat = json['category'];
      if (cat is String) {
        parsedCategoryId = cat;
      } else if (cat is Map && cat['_id'] != null) {
        parsedCategoryId = cat['_id'].toString();
      }
    }

    return CategoryDto(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      categoryId: parsedCategoryId,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? categoryId;
  final String? createdAt;
  final String? updatedAt;

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'image': image,
      if (categoryId != null) 'category': categoryId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
  Category toCategory({String? parentCategoryId}) {
    return Category(
      id: id,
      title: name,
      image: image,
      categoryId: categoryId ?? parentCategoryId,
    );
  }
}
