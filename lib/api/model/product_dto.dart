import 'package:ecommerce_app/api/model/category_dto.dart';
import 'package:ecommerce_app/api/model/brand_dto.dart';
import '../../domain/model/product.dart';

class ProductDto {
  ProductDto({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  num? sold;
  List<String>? images;
  List<CategoryDto>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryDto? category;
  BrandDto? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;

  /// ✅ fromJson (FIXED & SAFE)
  ProductDto.fromJson(dynamic json) {
    sold = json['sold'];

    images = json['images'] != null
        ? List<String>.from(
      json['images'].map((e) => e.toString()),
    )
        : [];

    subcategory = json['subcategory'] != null
        ? List<CategoryDto>.from(
      json['subcategory'].map(
            (v) => CategoryDto.fromJson(v),
      ),
    )
        : [];

    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];

    category = json['category'] != null
        ? CategoryDto.fromJson(json['category'])
        : null;

    brand = json['brand'] != null
        ? BrandDto.fromJson(json['brand'])
        : null;

    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  /// toJson
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['sold'] = sold;
    map['images'] = images;
    map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    map['ratingsQuantity'] = ratingsQuantity;
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['imageCover'] = imageCover;
    map['category'] = category?.toJson();
    map['brand'] = brand?.toJson();
    map['ratingsAverage'] = ratingsAverage;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;

    return map;
  }

  /// DTO → Domain
  Product toProduct() {
    return Product(
      sold: sold,
      images: images ?? [],
      subcategory: subcategory?.map((e) => e.toCategory()).toList() ?? [],
      ratingsQuantity: ratingsQuantity,
      id: id,
      title: title,
      slug: slug,
      description: description ?? '',
      quantity: quantity,
      price: price,
      imageCover: imageCover,
      category: category?.toCategory(),
      brand: brand?.toBrand(),
      ratingsAverage: ratingsAverage,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
