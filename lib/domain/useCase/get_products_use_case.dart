import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/product.dart';
import 'package:ecommerce_app/domain/model/sort_by.dart';
import 'package:ecommerce_app/domain/repos/products_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetProductsUseCase{
ProductsRepo productsRepo;
GetProductsUseCase(this.productsRepo);
Future<Result<List<Product>>> getProducts(
    {
      int limit=20,
      int page=1,
      String? keyword,
      String? brand,
      List<String>? categoryIn,
      String? subcategory,
      SortBy? sort,
    }
    ){
return productsRepo.getProducts(
  limit: limit,
  page: page,
  keyword: keyword,
  brand: brand,
  categoryIn: categoryIn,
  subcategory: subcategory,
  sort: sort?.value
);
}

}