import 'package:flutter/material.dart';
import '../domain/exceptions/exceptions.dart';
extension ContextErrorMessageExtractor on BuildContext{
  String getErrorMessage(Exception e) {
    if (e is ServerError) {
      var error = e; // casting
      return error.message ?? 'Something went wrong';
    } else if (e is NoInternetException) {
      return "No Internet Connection";
    }
    return "Something went wrong";
  }
}