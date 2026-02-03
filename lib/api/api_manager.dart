import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/model/response/CategoriesResponse.dart';
import 'package:ecommerce_app/api/model/response/login_model.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../core/app_const/app_const.dart';
import 'model/response/Signup_model.dart';
import 'model/response/BrandsResponse.dart';
import 'model/response/products_responsse.dart';
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
    var response= await _dio.get("/api/v1/categories");
    var categoriesResponse=CategoriesResponse.fromJson(response.data);
    return categoriesResponse;
    }
  Future<BrandsResponse> getBrands()async{
    var response= await _dio.get("/api/v1/brands");
    var brandsResponse =BrandsResponse.fromJson(response.data);
    return brandsResponse;
  }

  Future<LoginResponse> login(String email, String password) async{
      final response = await _dio.post(
        'https://ecommerce.routemisr.com/api/v1/auth/signin',
        data: {"email": email, "password": password},
      );
        return LoginResponse.fromJson(response.data);
  }
  Future<SignupModel> signUp(
      {required String name,
        required String email,
        required String password,
        required String phone}) async {
    final response = await _dio.post(
      AppConst.signUpEndPoint,
      data: {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": password,
        "phone": phone
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return SignupModel.fromJson(response.data);
    } else {
      throw Exception(response.data['message']);
    }
  }
  Future<ProductsResponse> getProducts({
    int? limit,
    int? page,
    String? keyword,
    String? brand,
    List<String>? categoryIn,
    String? subcategory,
    String? sort,
  }) async {
    Map<String, dynamic> queryParameters = {};

    if (limit != null) queryParameters['limit'] = limit;
    if (page != null) queryParameters['page'] = page;
    if (keyword != null) queryParameters['keyword'] = keyword;
    if (brand != null) queryParameters['brand'] = brand;
    if (categoryIn != null && categoryIn.isNotEmpty) {
      queryParameters['category[in]'] = categoryIn;
    }
    if (subcategory != null) queryParameters['subcategory'] = subcategory;
    if (sort != null) queryParameters['sort'] = sort;

    final response = await _dio.get(
      'https://ecommerce.routemisr.com/api/v1/products',
      queryParameters: queryParameters,
    );

    return ProductsResponse.fromJson(response.data);
  }
  Future<CategoriesResponse>getSubCategories(String id)async{
    var response= await _dio.get("/api/v1/categories/$id/subcategories");
    var categoriesResponse=CategoriesResponse.fromJson(response.data);
    return categoriesResponse;
  }
  }