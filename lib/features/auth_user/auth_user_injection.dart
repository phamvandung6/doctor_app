import 'package:doctor_app/features/auth_user/data/datasource/auth_local_data_source.dart';
import 'package:doctor_app/features/auth_user/data/datasource/auth_remote_data_source.dart';
import 'package:doctor_app/features/auth_user/data/datasource/auth_remote_data_source_firebase.dart';
import 'package:doctor_app/features/auth_user/data/repositories/auth_repository_impl.dart';
import 'package:doctor_app/features/auth_user/domain/repositories/auth_repository.dart';
import 'package:doctor_app/features/auth_user/domain/usecases/sign_in_use_case.dart';
import 'package:doctor_app/features/auth_user/domain/usecases/sign_out_use_case.dart';
import 'package:doctor_app/features/auth_user/domain/usecases/sign_up_use_case.dart';
import 'package:doctor_app/features/auth_user/domain/usecases/stream_auth_use_use_case.dart';
import 'package:doctor_app/features/auth_user/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:doctor_app/features/auth_user/presentation/blocs/sign_in_cubit/sign_in_cubit.dart';
import 'package:doctor_app/features/auth_user/presentation/blocs/sign_up_cubit/sign_up_cubit.dart';
import 'package:doctor_app/main_injection_container.dart';

Future<void> userInjectionContainer() async {
  sl.registerFactory<SignInCubit>(
    () => SignInCubit(signInUseCase: sl()),
  );

  sl.registerFactory<SignUpCubit>(
    () => SignUpCubit(signUpUseCase: sl()),
  );

  sl.registerFactory<AuthCubit>(
    () => AuthCubit(),
  );

  //usecases
  sl.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(authRepository: sl()),
  );

  sl.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(authRepository: sl()),
  );

  sl.registerLazySingleton<SignOutUseCase>(
    () => SignOutUseCase(authRepository: sl()),
  );

  sl.registerLazySingleton<StreamAuthUserUseCase>(
    () => StreamAuthUserUseCase(authRepository: sl()),
  );

  //repo and datasource
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceFirebase(
      firebaseAuth: sl(),
    ),
  );

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(),
  );
}
