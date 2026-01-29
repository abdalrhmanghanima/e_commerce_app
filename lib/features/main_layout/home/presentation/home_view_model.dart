import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/sort_by.dart';
import 'package:ecommerce_app/domain/useCase/get_brands_use_case.dart';
import 'package:ecommerce_app/domain/useCase/get_categories_use_case.dart';
import 'package:ecommerce_app/domain/useCase/get_products_use_case.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeViewModel extends Cubit<HomeState>{

  GetCategoriesUseCase categoriesUseCase;
  GetBrandsUseCase brandsUseCase;
  GetProductsUseCase productsUseCase;
  HomeViewModel(this.categoriesUseCase,this.brandsUseCase,this.productsUseCase)
      :super(
      HomeState(
          brandsState: InitialState(),
          categoriesState: InitialState(),
          productsState: InitialState(),
      )
  );
  void loadHomeScreen(){
    _getBrands();
    _getCategories();
    _getMostSellingProducts();
  }
  void _getCategories()async{
    emit(state.copyWith(categoriesState: LoadingState()));
    var response = await categoriesUseCase.getCategories();
    switch(response){
      case Failure():{
        emit(state.copyWith(categoriesState: ErrorState(response.exception)));
      }
      case Success():{
        emit(state.copyWith(categoriesState: SuccessState(response.data)));
      }
    }
}
  void _getBrands()async{
    emit(state.copyWith(brandsState: LoadingState()));
    var response = await brandsUseCase.getBrands();
    switch(response){
      case Failure():{
        emit(state.copyWith(brandsState: ErrorState(response.exception)));
      }
      case Success():{
        emit(state.copyWith(brandsState: SuccessState(response.data)));
      }
    }
  }

  void _getMostSellingProducts() async{
    emit(state.copyWith(
      productState: LoadingState()
    ));
    var response = await productsUseCase.getProducts(
      limit: 10,
      sort: SortBy.MostSelling
    );
    switch(response){
      case Failure():{
        emit(state.copyWith(
          productState: ErrorState(response.exception)
        ));
      }
      case Success():{
        emit(state.copyWith(
          productState: SuccessState(response.data)
        ));
      }
    }
  }
}