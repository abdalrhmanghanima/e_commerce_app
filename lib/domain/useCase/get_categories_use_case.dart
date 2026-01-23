import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/category.dart';
import 'package:ecommerce_app/domain/repos/categories_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetCategoriesUseCase{
  CategoriesRepo categoriesRepo;
  GetCategoriesUseCase(this.categoriesRepo);
  Future<Result<List<Category>>> getCategories(){
    return categoriesRepo.getCategories();
  }
}