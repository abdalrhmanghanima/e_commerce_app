import 'package:ecommerce_app/api/model/response/Signup_model.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/auth_result.dart';

import '../../api/model/response/login_model.dart';

abstract class AuthDataSource{
  Future<SignupModel> signUp({
    required String name,
    required String email,
    required String password,
    required String phone
});
  Future<Result<AuthResult>> login(String email , String password);
}