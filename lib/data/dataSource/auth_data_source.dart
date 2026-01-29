import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/auth_result.dart';

abstract class AuthDataSource{
  Future<Result<AuthResult>> signUp({
    required String name,
    required String email,
    required String password,
    required String phone
});
  Future<Result<AuthResult>> login(String email , String password);
}