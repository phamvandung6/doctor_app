import 'package:doctor_app/features/patients/domain/entities/patient_entity.dart';
import 'package:doctor_app/features/patients/domain/repositories/patient_repository.dart';
import 'package:equatable/equatable.dart';

class CreatePatientUseCase {
  final PatientRepository patientRepository;

  CreatePatientUseCase({required this.patientRepository});

  Future<void> call({required CreatePatientParams params}) async {
    try {
      await patientRepository.createPatient(patient: params.patient);
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}

class CreatePatientParams extends Equatable {
  final PatientEntity patient;

  const CreatePatientParams({required this.patient});

  @override
  List<Object> get props => [patient];
}
