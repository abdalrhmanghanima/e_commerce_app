
import '../../../../domain/model/auth_result.dart';

abstract class SignUpState {}
class InitState extends SignUpState {}
class LoadingState extends SignUpState {}

class ErrorState extends SignUpState {
  final String message;
  ErrorState(this.message);
}

class SuccessState extends SignUpState {
  final AuthResult authResult;
  SuccessState(this.authResult);
}
