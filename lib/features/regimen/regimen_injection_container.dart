import 'package:doctor_app/features/regimen/data/datasources/regimen_remote_data_source.dart';
import 'package:doctor_app/features/regimen/data/datasources/regimen_remote_data_source_firebase.dart';
import 'package:doctor_app/features/regimen/data/repositories/regimen_repository_impl.dart';
import 'package:doctor_app/features/regimen/domain/repositories/regimen_repository.dart';
import 'package:doctor_app/features/regimen/domain/usecases/create_regimen_use_case.dart';
import 'package:doctor_app/features/regimen/domain/usecases/delete_regimen_use_case.dart';
import 'package:doctor_app/features/regimen/domain/usecases/get_regimens_use_case.dart';
import 'package:doctor_app/features/regimen/presentation/blocs/pick_regimen_cubit/pick_regimen_cubit.dart';
import 'package:doctor_app/features/regimen/presentation/blocs/regimen_cubit/regimen_cubit.dart';
import 'package:doctor_app/main_injection_container.dart';

Future<void> regimenInjectionContainer() async {
  sl.registerFactory<RegimenCubit>(() => RegimenCubit(
        createRegimenUseCase: sl(),
        deleteRegimenUseCase: sl(),
        getRegimensUseCase: sl(),
      ));

  sl.registerFactory<PickRegimenCubit>(
    () => PickRegimenCubit(),
  );

  sl.registerLazySingleton<CreateRegimenUseCase>(
      () => CreateRegimenUseCase(regimenRepository: sl()));

  sl.registerLazySingleton<DeleteRegimenUseCase>(
      () => DeleteRegimenUseCase(regimenRepository: sl()));

  sl.registerLazySingleton<GetRegimensUseCase>(
      () => GetRegimensUseCase(regimenRepository: sl()));

  sl.registerLazySingleton<RegimenRepository>(
      () => RegimenRepositoryImpl(remoteDataSource: sl()));

  sl.registerLazySingleton<RegimenRemoteDataSource>(
      () => RegimenRemoteDataSourceFirebase(firebaseFirestore: sl()));
}
