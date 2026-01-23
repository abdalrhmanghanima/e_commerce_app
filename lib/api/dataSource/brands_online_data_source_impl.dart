import 'package:ecommerce_app/api/execute_api.dart';
import 'package:ecommerce_app/data/dataSource/brands_online_data_source.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/brand.dart';
import 'package:injectable/injectable.dart';

import '../api_manager.dart';
@Injectable(as:  BrandsOnlineDataSource)
class BrandsOnlineDataSourceImpl implements BrandsOnlineDataSource{
  ApiManager apiManager;
  BrandsOnlineDataSourceImpl(this.apiManager);
  @override
  Future<Result<List<Brand>>> getBrands() async{
   return executeApi(() async{
     var response = await apiManager.getBrands();
     var data= response.data?.map((brandDto) => brandDto.toBrand()).toList()??[];
     return data;
   },);
  }
}