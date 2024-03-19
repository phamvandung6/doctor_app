import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/auth_user/domain/usecases/sign_in_use_case.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInUseCase signInUseCase;

  SignInCubit({
    required this.signInUseCase,
  }) : super(SignInInitial());

  Future<void> signIn(String email, String password) async {
    emit(SignInLoading());
    try {
      await signInUseCase.call(
        SignInParams(
          email: email,
          password: password,
        ),
      );
      emit(SignInSuccess());
    } catch (err) {
      emit(SignInError(message: err.toString()));
    }
  }
}
