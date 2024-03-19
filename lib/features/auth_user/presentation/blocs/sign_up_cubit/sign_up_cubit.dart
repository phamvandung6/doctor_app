import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/auth_user/domain/usecases/sign_up_use_case.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpCubit({required this.signUpUseCase}) : super(SignUpInitial());

  Future<void> signUp(String email, String password) async {
    emit(SignUpLoading());
    try {
      await signUpUseCase.call(
        SignUpParams(
          email: email,
          password: password,
        ),
      );
      emit(SignUpSuccess());
    } catch (err) {
      emit(SignUpError(message: err.toString()));
    }
  }
}
