import 'package:ecommerce_app/api/api_manager.dart';
import 'package:ecommerce_app/data/dataSource/categories_online_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/category.dart';
@Injectable(as: CategoriesOnlineDataSource)
class CategoriesOnlineDataSourceImpl implements CategoriesOnlineDataSource{
  ApiManager apiManager;
  CategoriesOnlineDataSourceImpl(this.apiManager);
  @override
  Future<List<Category>> getCategories() async{
    var response = await apiManager.getCategories();
    return response.data?.map((dto) => dto.toCategory()).toList()??[];
  }
}