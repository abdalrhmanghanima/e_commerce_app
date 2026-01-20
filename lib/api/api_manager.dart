import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/model/response/categoriesResponse/CategoriesResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
@singleton
class ApiManager{

  final  _dio=Dio();

  ApiManager(){
    _dio.options.baseUrl="https://ecommerce.routemisr.com/";
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90
    ));
  }
    Future<CategoriesResponse>getCategories()async{
    var response= await _dio.get("v1/categories");
    var categoriesResponse=CategoriesResponse.fromJson(response.data);
    return categoriesResponse;
    }
  }