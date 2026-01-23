import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/brand.dart';

abstract class BrandsRepo {
  Future<Result<List<Brand>>> getBrands();
}
