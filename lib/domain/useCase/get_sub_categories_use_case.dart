import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/category.dart';
import 'package:ecommerce_app/domain/repos/categories_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetSubCategoriesUseCase{
  CategoriesRepo categoriesRepo;
  GetSubCategoriesUseCase(this.categoriesRepo);
  Future<Result<List<Category>>> getSubCategories(String id){
    return categoriesRepo.getSubCategories(id);
  }
}