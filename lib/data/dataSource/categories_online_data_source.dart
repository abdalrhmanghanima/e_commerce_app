import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/category.dart';

abstract class CategoriesOnlineDataSource{

  Future<Result<List<Category>>> getCategories();

}