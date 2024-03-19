import 'package:doctor_app/features/auth_user/domain/entities/auth_user.dart';
import 'package:doctor_app/features/auth_user/domain/repositories/auth_repository.dart';

class StreamAuthUserUseCase {
  final AuthRepository authRepository;

  StreamAuthUserUseCase({required this.authRepository});

  Stream<AuthUser> call() {
    try {
      return authRepository.authUser;
    } catch (error) {
      throw Exception(error);
    }
  }
}