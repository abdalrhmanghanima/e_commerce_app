import 'package:ecommerce_app/api/model/pagination_dto.dart';
import 'package:ecommerce_app/api/model/product_dto.dart';
class ProductsResponse {
  ProductsResponse({
    this.results,
    this.metadata,
    this.data,});

  ProductsResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? PaginationInfo.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDto.fromJson(v));
      });
    }
  }
  num? results;
  PaginationInfo? metadata;
  List<ProductDto>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}