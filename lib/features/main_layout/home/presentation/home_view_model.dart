import 'package:ecommerce_app/domain/repos/categories_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeViewModel{

  CategoriesRepo categoriesRepo;
  HomeViewModel(this.categoriesRepo);
  void getCategories()async{
    var categories = await categoriesRepo.getCategories();
}
}