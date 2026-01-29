import 'package:ecommerce_app/api/api_manager.dart';
import 'package:ecommerce_app/api/execute_api.dart';
import 'package:ecommerce_app/data/dataSource/products_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../domain/api_result.dart';
import '../../domain/model/product.dart';
@Injectable(as: ProductsDataSource)
class ProductsDataSourceImpl implements ProductsDataSource{
  ApiManager apiManager;
  ProductsDataSourceImpl(this.apiManager);
  @override
  Future<Result<List<Product>>> getProducts({int limit = 20, int page = 1, String? keyword, String? brand, List<String>? categoryIn, String? subcategory, String? sort}) {
   return executeApi(()async{
     var response = await apiManager.getProducts(
         limit: limit,
         page: page,
         keyword: keyword,
         brand: brand,
         categoryIn: categoryIn,
         subcategory: subcategory,
         sort: sort,
     );
     return response.data?.map((productDto) => productDto.toProduct()).toList()??[];

   });
  }
  }