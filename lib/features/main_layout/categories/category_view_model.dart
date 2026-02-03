import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/useCase/get_categories_use_case.dart';
import 'package:ecommerce_app/domain/useCase/get_sub_categories_use_case.dart';
import 'package:ecommerce_app/features/main_layout/categories/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryViewModel extends Cubit<CategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetSubCategoriesUseCase _getSubCategoriesUseCase;
  CategoryViewModel(this._getCategoriesUseCase,this._getSubCategoriesUseCase)
      : super(CategoriesState(categoriesState: InitialState(),subCategoriesState: InitialState()));
  void getCategories()async{
    emit(state.copyWith(categoriesState: LoadingState()));
    var response= await _getCategoriesUseCase.getCategories();
    switch(response){
      case Failure():{
        emit(state.copyWith(categoriesState: ErrorState(response.exception)));
      }
      case Success():{
        emit(state.copyWith(categoriesState: SuccessState(response.data)));
        if(response.data.isNotEmpty){
         final firstCategory= response.data[0];
         selectedCategory(firstCategory.id??'', 0);
        }
      }
    }
  }
  void selectedCategory(String id, int index){
    emit(state.copyWith(selectedCategoryIndex: index,selectedCategoryId: id));
    getSubCategories(id);
  }
  void getSubCategories(String id) async {
    emit(state.copyWith(subCategoriesState: LoadingState()));
    var response = await _getSubCategoriesUseCase.getSubCategories(id);
    switch (response) {
      case Failure():
        emit(state.copyWith(subCategoriesState: ErrorState(response.exception)));
      case Success():
        emit(state.copyWith(subCategoriesState: SuccessState(response.data)));
    }
  }
}
