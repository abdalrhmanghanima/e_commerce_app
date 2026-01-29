import 'package:ecommerce_app/data/dataSource/auth_data_source.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';
import '../../domain/model/auth_result.dart';
@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthDataSource _authDataSource;
  AuthRepoImpl(this._authDataSource);
  @override
  Future<Result<AuthResult>> signUp(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
      return _authDataSource.signUp(
          name: name, email: email, password: password, phone: phone);
    }
  @override
  Future<Result<AuthResult>> login(String email, String password)async {
      final result =  await _authDataSource.login(email, password);
      return result;
  }
}
