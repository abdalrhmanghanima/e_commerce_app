import 'package:ecommerce_app/api/api_manager.dart';
import 'package:ecommerce_app/api/execute_api.dart';
import 'package:ecommerce_app/data/dataSource/categories_online_data_source.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/category.dart';

@Injectable(as: CategoriesOnlineDataSource)
class CategoriesOnlineDataSourceImpl
    implements CategoriesOnlineDataSource {
  final ApiManager apiManager;

  CategoriesOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Category>>> getCategories() async {
    return executeApi(() async {
      final response = await apiManager.getCategories();

      final data = response.data
          ?.map((dto) => dto.toCategory())
          .toList() ??
          [];

      return data;
    });
  }

  @override
  Future<Result<List<Category>>> getSubCategories({
    required String id,
  }) async {
    return executeApi(() async {
      final response = await apiManager.getSubCategories(id);

      final data = response.data
          ?.map(
            (catDto) =>
            catDto.toCategory(parentCategoryId: id),
      )
          .toList() ??
          [];

      return data;
    });
  }
}
