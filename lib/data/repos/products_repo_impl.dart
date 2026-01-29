import 'package:ecommerce_app/data/dataSource/products_data_source.dart';
import 'package:ecommerce_app/domain/repos/products_repo.dart';
import 'package:injectable/injectable.dart';

import '../../domain/api_result.dart';
import '../../domain/model/product.dart';
@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo{
  ProductsDataSource productsDataSource;
  ProductsRepoImpl(this.productsDataSource);
  @override
  Future<Result<List<Product>>> getProducts({int limit = 20, int page = 1, String? keyword, String? brand, List<String>? categoryIn, String? subcategory, String? sort}) {
  return productsDataSource.getProducts(
      limit: limit,
      page: page,
      keyword: keyword,
      brand: brand,
      categoryIn: categoryIn,
      subcategory: subcategory,
      sort: sort
  );
  }
}