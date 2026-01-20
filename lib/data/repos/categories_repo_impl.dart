import 'package:ecommerce_app/data/dataSource/categories_online_data_source.dart';
import 'package:ecommerce_app/domain/repos/categories_repo.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/category.dart';
@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo{
  CategoriesOnlineDataSource onlineDataSource;
  CategoriesRepoImpl(this.onlineDataSource);
  @override
  Future<List<Category>> getCategories() async{
    return onlineDataSource.getCategories();
}
}