import 'package:ecommerce_app/domain/api_result.dart';
import 'package:injectable/injectable.dart';

import '../model/auth_result.dart';
import '../repos/auth_repo.dart';
@injectable
class LoginUseCase {
  final AuthRepo _repository;

  LoginUseCase(this._repository);

  Future<Result<AuthResult>> call(
      String email,
      String password,
      ) {
    return  _repository.login(email, password);
  }
}