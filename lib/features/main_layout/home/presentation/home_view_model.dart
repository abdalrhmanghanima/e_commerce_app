import 'package:ecommerce_app/core/common/component_state.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/useCase/get_brands_use_case.dart';
import 'package:ecommerce_app/domain/useCase/get_categories_use_case.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeViewModel extends ChangeNotifier{

  GetCategoriesUseCase categoriesUseCase;
  GetBrandsUseCase brandsUseCase;
  HomeViewModel(this.categoriesUseCase,this.brandsUseCase);
  HomeState state=HomeState(
      brandsState: InitialState(),
      categoriesState: InitialState()
  );
  void loadHomeScreen(){
    _getBrands();
    _getCategories();
  }
  void _getCategories()async{
    sendState(state.copyWith(categoriesState: LoadingState()));
    var response = await categoriesUseCase.getCategories();
    switch(response){
      case Failure():{
     sendState(state.copyWith(categoriesState: ErrorState(response.exception)));
      }
      case Success():{
      sendState(state.copyWith(categoriesState: SuccessState(response.data)));
      }
    }
}
  void _getBrands()async{
    sendState(state.copyWith(brandsState: LoadingState()));
    var response = await brandsUseCase.getBrands();
    switch(response){
      case Failure():{
        sendState(state.copyWith(brandsState: ErrorState(response.exception)));
      }
      case Success():{
        sendState(state.copyWith(brandsState: SuccessState(response.data)));
      }
    }
  }
  void sendState(HomeState newState){
    state=newState;
    notifyListeners();
  }
}