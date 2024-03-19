import 'package:doctor_app/features/patients/data/models/patient_model.dart';

abstract class PatientRemoteDataSource {
  Stream<List<PatientModel>> getPatients({required String roomId});

  Future<void> createPatient({required PatientModel patient});

  Future<void> updatePatient({required PatientModel patient});

  Future<void> deletePatient({required String id});

  Future<List<PatientModel>> getPatientById({required String id});
}
