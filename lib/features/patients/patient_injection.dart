import 'package:doctor_app/features/patients/data/datasources/patient_remote_data_source.dart';
import 'package:doctor_app/features/patients/data/datasources/patient_remote_data_source_firebase.dart';
import 'package:doctor_app/features/patients/data/repositories/patient_repository.dart';
import 'package:doctor_app/features/patients/domain/repositories/patient_repository.dart';
import 'package:doctor_app/features/patients/domain/usecases/create_patient_use_case.dart';
import 'package:doctor_app/features/patients/domain/usecases/delete_patient_use_case.dart';
import 'package:doctor_app/features/patients/domain/usecases/get_patient_by_id_use_case.dart';
import 'package:doctor_app/features/patients/domain/usecases/get_patients_use_case.dart';
import 'package:doctor_app/features/patients/domain/usecases/update_patient_use_case.dart';
import 'package:doctor_app/features/patients/presentation/blocs/patient_cubit/patient_cubit.dart';
import 'package:doctor_app/features/patients/presentation/blocs/pick_patient_cubit/pick_patient_cubit.dart';
import 'package:doctor_app/main_injection_container.dart';

Future<void> patientInjectionContainer() async {
  sl.registerFactory<PatientCubit>(
    () => PatientCubit(
      getPatientsUseCase: sl(),
      createPatientUseCase: sl(),
      updatePatientUseCase: sl(),
      deletePatientUseCase: sl(),
      getPatientByIdUseCase: sl(),
    ),
  );

  sl.registerFactory<PickPatientCubit>(() => PickPatientCubit());

  sl.registerLazySingleton<GetPatientsUseCase>(
    () => GetPatientsUseCase(patientRepository: sl()),
  );

  sl.registerLazySingleton<GetPatientByIdUseCase>(
    () => GetPatientByIdUseCase(patientRepository: sl()),
  );

  sl.registerLazySingleton<CreatePatientUseCase>(
    () => CreatePatientUseCase(patientRepository: sl()),
  );

  sl.registerLazySingleton<UpdatePatientUseCase>(
    () => UpdatePatientUseCase(patientRepository: sl()),
  );

  sl.registerLazySingleton<DeletePatientUseCase>(
    () => DeletePatientUseCase(patientRepository: sl()),
  );

  sl.registerLazySingleton<PatientRepository>(
    () => PatientRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<PatientRemoteDataSource>(
    () => PatientRemoteDataSourceFirebase(
      firebaseFirestore: sl(),
    ),
  );
}
