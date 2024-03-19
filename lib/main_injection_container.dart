import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/features/auth_user/auth_user_injection.dart';
import 'package:doctor_app/features/patients/patient_injection.dart';
import 'package:doctor_app/features/regimen/regimen_injection_container.dart';
import 'package:doctor_app/features/rooms/room_injection.dart';
import 'package:doctor_app/features/treatment/treatment_injection_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);

  await userInjectionContainer();
  await roomInjectionContainer();
  await patientInjectionContainer();
  await regimenInjectionContainer();
  await treatmentInjectionContainer();
}
