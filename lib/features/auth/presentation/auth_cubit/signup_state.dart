
import '../../../../domain/model/auth_result.dart';

abstract class SignUpState {}
class InitState extends SignUpState {}
class LoadingState extends SignUpState {}

class ErrorState extends SignUpState {
  final Exception exception;
  ErrorState(this.exception);
}

class SuccessState extends SignUpState {
  final AuthResult authResult;
  SuccessState(this.authResult);
}
