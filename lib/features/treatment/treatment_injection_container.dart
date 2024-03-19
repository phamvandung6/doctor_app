import 'package:doctor_app/features/treatment/data/datasources/tpn_remote_data_source.dart';
import 'package:doctor_app/features/treatment/data/datasources/tpn_remote_data_source_firebase.dart';
import 'package:doctor_app/features/treatment/data/repositories/tpn_repository_impl.dart';
import 'package:doctor_app/features/treatment/domain/repositories/tpn_repository.dart';
import 'package:doctor_app/features/treatment/domain/usecases/add_medical_check_glucose_use_case.dart';
import 'package:doctor_app/features/treatment/domain/usecases/add_medical_take_insulin_use_case.dart';
import 'package:doctor_app/features/treatment/domain/usecases/create_tpn_treatment_use_case.dart';
import 'package:doctor_app/features/treatment/domain/usecases/get_passing_count_use_case.dart';
import 'package:doctor_app/features/treatment/domain/usecases/get_tpn_history_use_case.dart';
import 'package:doctor_app/features/treatment/domain/usecases/get_tpn_step_use_case.dart';
import 'package:doctor_app/features/treatment/domain/usecases/get_unpassing_count.dart';
import 'package:doctor_app/features/treatment/domain/usecases/update_desciption_use_case.dart';
import 'package:doctor_app/features/treatment/domain/usecases/update_passing_count_use_case.dart';
import 'package:doctor_app/features/treatment/domain/usecases/update_unpassing_count_use_case.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/check_time_cubit/check_time_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/get_history_cubit/get_history_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/tpn_cubit/tpn_cubit.dart';
import 'package:doctor_app/main_injection_container.dart';

Future<void> treatmentInjectionContainer() async {
  sl.registerFactory<TpnCubit>(() => TpnCubit(
        addMedicalCheckGlucoseUseCase: sl(),
        addMedicalTakeInsulinUseCase: sl(),
        tpnUpdateDescriptionUseCase: sl(),
        getTpnStepUseCase: sl(),
        createTpnTreatmentUseCase: sl(),
        getPassingCountUseCase: sl(),
        getUnpassingCountUseCase: sl(),
        updatePassingCountUseCase: sl(),
        updateUnpassingCountUseCase: sl(),
      ));

  sl.registerFactory<CheckTimeCubit>(
    () => CheckTimeCubit(),
  );

  sl.registerFactory<GetHistoryCubit>(
    () => GetHistoryCubit(
      getTpnHistoryUseCase: sl(),
    ),
  );
  //usecases
  sl.registerLazySingleton<AddMedicalCheckGlucoseUseCase>(
      () => AddMedicalCheckGlucoseUseCase(
            tpnRepository: sl(),
          ));

  sl.registerLazySingleton<AddMedicalTakeInsulinUseCase>(
      () => AddMedicalTakeInsulinUseCase(
            tpnRepository: sl(),
          ));

  sl.registerLazySingleton<TpnUpdateDescriptionUseCase>(
      () => TpnUpdateDescriptionUseCase(
            tpnRepository: sl(),
          ));

  sl.registerLazySingleton<GetTpnStepUseCase>(
    () => GetTpnStepUseCase(
      tpnRepository: sl(),
    ),
  );

  sl.registerLazySingleton<CreateTpnTreatmentUseCase>(
    () => CreateTpnTreatmentUseCase(
      tpnRepository: sl(),
    ),
  );

  sl.registerLazySingleton<GetPassingCountUseCase>(
    () => GetPassingCountUseCase(
      tpnRepository: sl(),
    ),
  );

  sl.registerLazySingleton<GetUnpassingCountUseCase>(
    () => GetUnpassingCountUseCase(
      tpnRepository: sl(),
    ),
  );

  sl.registerLazySingleton<UpdatePassingCountUseCase>(
    () => UpdatePassingCountUseCase(
      tpnRepository: sl(),
    ),
  );

  sl.registerLazySingleton<UpdateUnpassingCountUseCase>(
    () => UpdateUnpassingCountUseCase(
      tpnRepository: sl(),
    ),
  );

  sl.registerLazySingleton<GetTpnHistoryUseCase>(
    () => GetTpnHistoryUseCase(
      tpnRepository: sl(),
    ),
  );

  //repository
  sl.registerLazySingleton<TpnRepository>(
    () => TpnRepositoryImpl(tpnRemoteDataSource: sl()),
  );

  //datasource
  sl.registerLazySingleton<TpnRemoteDataSource>(
    () => TpnRemoteDataSourceFirebase(
      firestore: sl(),
    ),
  );
}
