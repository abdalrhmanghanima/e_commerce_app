import 'package:ecommerce_app/domain/api_result.dart';
import '../model/auth_result.dart';

abstract class AuthRepo{
  Future<Result<AuthResult>> signUp({
    required String name,
    required String email,
    required String password,
    required String phone});
  Future<Result<AuthResult>> login(String email, String password);
}