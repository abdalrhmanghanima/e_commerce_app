
import 'package:ecommerce_app/domain/api_result.dart';

import '../model/category.dart';

abstract class CategoriesRepo{

  Future<Result<List<Category>>> getCategories();

}