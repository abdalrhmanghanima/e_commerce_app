import 'package:ecommerce_app/domain/model/category.dart';

abstract class CategoriesOnlineDataSource{

  Future<List<Category>> getCategories();

}