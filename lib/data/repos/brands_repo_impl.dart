import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/repos/brands_repo.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/brand.dart';
import '../dataSource/brands_online_data_source.dart';
@Injectable(as: BrandsRepo)
class BrandsRepoImpl implements BrandsRepo{
BrandsOnlineDataSource onlineDataSource;
BrandsRepoImpl(this.onlineDataSource);
@override
  Future<Result<List<Brand>>> getBrands() {
    return onlineDataSource.getBrands();
  }
}