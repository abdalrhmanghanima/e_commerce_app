import 'package:ecommerce_app/features/auth/presentation/auth_cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/api_result.dart';
import '../../../../domain/model/auth_result.dart';
import '../../../../domain/repos/auth_repo.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo _authRepo;

  SignUpCubit(this._authRepo) : super(InitState());

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(LoadingState());

    final result = await _authRepo.signUp(
      name: name,
      email: email,
      password: password,
      phone: phone,
    );

    if (result is Success<AuthResult>) {
      emit(SuccessState(result.data));
    } else if (result is Failure<AuthResult>) {
      emit(ErrorState(result.exception.toString()));
    }

  }
}
