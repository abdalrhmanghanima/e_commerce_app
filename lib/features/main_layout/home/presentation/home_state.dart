import 'package:ecommerce_app/domain/model/brand.dart';
import 'package:ecommerce_app/domain/model/category.dart';
import 'package:ecommerce_app/domain/model/product.dart';

import '../../../../core/common/component_state.dart';

class HomeState {
  final ComponentState<List<Brand>> brandsState;
  final ComponentState<List<Category>> categoriesState;
  final ComponentState<List<Product>> productsState;

  HomeState({
    required this.brandsState,
    required this.categoriesState,
    required this.productsState,
  });

  HomeState copyWith({
    ComponentState<List<Brand>>? brandsState,
    ComponentState<List<Category>>? categoriesState,
    ComponentState<List<Product>>? productState,
  }) {
    return HomeState(
      brandsState: brandsState ?? this.brandsState,
      categoriesState: categoriesState ?? this.categoriesState,
      productsState: productState ?? this.productsState, // ⭐ المهم
    );
  }
}
