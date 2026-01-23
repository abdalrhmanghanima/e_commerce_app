import 'package:ecommerce_app/api/api_manager.dart';
import 'package:ecommerce_app/api/execute_api.dart';
import 'package:ecommerce_app/data/dataSource/categories_online_data_source.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/category.dart';
@Injectable(as: CategoriesOnlineDataSource)
class CategoriesOnlineDataSourceImpl implements CategoriesOnlineDataSource{
  ApiManager apiManager;
  CategoriesOnlineDataSourceImpl(this.apiManager);
  @override
  Future<Result<List<Category>>> getCategories() async{
    return executeApi(()async{
      var response = await apiManager.getCategories();
      var data= response.data?.map((dto) => dto.toCategory()).toList()??[];
      return data;
    },);
  }
}