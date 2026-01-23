import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/brand.dart';
import 'package:ecommerce_app/domain/repos/brands_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetBrandsUseCase{
  BrandsRepo brandsRepo;
  GetBrandsUseCase(this.brandsRepo);
  Future<Result<List<Brand>>> getBrands(){
    return brandsRepo.getBrands();
  }
}