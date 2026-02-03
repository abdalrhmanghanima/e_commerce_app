import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/domain/model/category.dart';
import 'package:equatable/equatable.dart';

class CategoriesState extends Equatable {
  final ComponentState<List<Category>> categoriesState;
  final ComponentState<List<Category>> subCategoriesState;

  /// currently selected category
  final String? selectedCategoryId;
  final int selectedCategoryIndex;

  const CategoriesState({
    required this.categoriesState,
    required this.subCategoriesState,
    this.selectedCategoryId,
    this.selectedCategoryIndex = 0,
  });

  @override
  List<Object?> get props => [
    categoriesState,
    subCategoriesState,
    selectedCategoryId,
    selectedCategoryIndex,
  ];

  CategoriesState copyWith({
    ComponentState<List<Category>>? categoriesState,
    ComponentState<List<Category>>? subCategoriesState,
    String? selectedCategoryId,
    int? selectedCategoryIndex,
  }) {
    return CategoriesState(
      categoriesState: categoriesState ?? this.categoriesState,
      subCategoriesState: subCategoriesState ?? this.subCategoriesState,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      selectedCategoryIndex:
      selectedCategoryIndex ?? this.selectedCategoryIndex,
    );
  }
}
