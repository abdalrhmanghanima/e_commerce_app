import 'package:equatable/equatable.dart';

/// Domain model for Category (and SubCategory).
/// [categoryId] links a subcategory to its parent category when present.
class Category extends Equatable {
  final String? id;
  final String? title;
  final String? image;
  /// Parent category id; null for top-level categories.
  final String? categoryId;

  const Category({
    this.id,
    this.title,
    this.image,
    this.categoryId,
  });

  bool get isSubCategory => categoryId != null && categoryId!.isNotEmpty;

  @override
  List<Object?> get props => [id, categoryId];
}