import 'package:doctor_app/features/patients/data/datasources/patient_remote_data_source.dart';
import 'package:doctor_app/features/patients/data/models/patient_model.dart';
import 'package:doctor_app/features/patients/domain/entities/patient_entity.dart';
import 'package:doctor_app/features/patients/domain/repositories/patient_repository.dart';

class PatientRepositoryImpl implements PatientRepository {
  final PatientRemoteDataSource remoteDataSource;

  PatientRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> createPatient({required PatientEntity patient}) async =>
      await remoteDataSource.createPatient(
          patient: PatientModel.fromEntity(patient));

  @override
  Future<void> deletePatient({required String id}) async =>
      await remoteDataSource.deletePatient(id: id);
  @override
  Future<List<PatientEntity>> getPatientById({required String id}) async {
    var event = await remoteDataSource.getPatientById(id: id);
    return event.map((e) => PatientModel.fromEntity(e)).toList();
  }

  @override
  Stream<List<PatientEntity>> getPatients({required String roomId}) =>
      remoteDataSource.getPatients(roomId: roomId);

  @override
  Future<void> updatePatient({required PatientEntity patient}) async =>
      await remoteDataSource.updatePatient(
          patient: PatientModel.fromEntity(patient));
}
