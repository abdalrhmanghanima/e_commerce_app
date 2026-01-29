import 'package:ecommerce_app/api/api_manager.dart';
import 'package:ecommerce_app/api/execute_api.dart';
import 'package:ecommerce_app/data/dataSource/auth_data_source.dart';
import 'package:ecommerce_app/domain/api_result.dart';
import 'package:ecommerce_app/domain/model/auth_result.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  ApiManager apiManager;
  AuthDataSourceImpl(this.apiManager);
  @override
  Future<Result<AuthResult>> signUp(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    return executeApi(() async {
      final response = await apiManager.signUp(
          name: name, email: email, password: password, phone: phone);
      return response.toEntity();
    });
  }
  @override
  Future<Result<AuthResult>> login(String email, String password) async {
     return executeApi(()async{
      var response= await apiManager.login(email, password);
      return response.toEntity();
    },);
  }
}
