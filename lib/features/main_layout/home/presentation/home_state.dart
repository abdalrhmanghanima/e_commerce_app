import 'package:ecommerce_app/domain/model/brand.dart';
import 'package:ecommerce_app/domain/model/category.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/common/component_state.dart';

class HomeState extends Equatable{
  ComponentState<List<Brand>> brandsState;
  ComponentState<List<Category>> categoriesState;
  @override
  List<Object?> get props => [brandsState,categoriesState];

  HomeState({
    required this.brandsState,
    required this.categoriesState,
  });

  HomeState copyWith({
    ComponentState<List<Brand>>? brandsState,
    ComponentState<List<Category>>? categoriesState,
  }) {
    return HomeState(
      brandsState: brandsState ?? this.brandsState,
      categoriesState: categoriesState ?? this.categoriesState,
    );
  }
}
