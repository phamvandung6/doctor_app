import 'package:doctor_app/features/patients/domain/entities/patient_entity.dart';

abstract class PatientRepository {
  Stream<List<PatientEntity>> getPatients({required String roomId});

  Future<List<PatientEntity>> getPatientById({required String id});

  Future<void> createPatient({required PatientEntity patient});

  Future<void> updatePatient({required PatientEntity patient});

  Future<void> deletePatient({required String id});
}
