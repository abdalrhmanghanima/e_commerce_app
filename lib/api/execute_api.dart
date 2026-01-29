import 'package:dio/dio.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/exceptions/exceptions.dart';

Future<Result<T>> executeApi<T>(Future<T> apiCall())async{
  try {
    final response = await apiCall();
    return Success(response);
    // if (response.statusCode == 200) {
    // } else {
    //   return Failure(Exception('Login failed with states code ${response.statusCode}'));
    // }
  } on DioException catch (e) {
    switch(e.type){

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:{
      return Failure(NoInternetException(message: 'no internet connection'));
    }
        default:{
     if (e.response != null) {
       final data = e.response?.data;
       String? message;
       String? statusMsg;
       if (data is Map) {
         message = data['message']?.toString();
         statusMsg = data['statusMsg']?.toString();
       } else if (data is String) {
         message = data;
       } else {
         message = e.message;
       }
       return Failure(ServerError(message: message, statusMsg: statusMsg));
     }
     return Failure(Exception('Something Went Wrong'));
    }
    }
  } catch (e) {
    // Ensure we never throw from error parsing / mapping.
    return Failure(Exception(e.toString()));
  }
}