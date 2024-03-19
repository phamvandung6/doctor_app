import 'package:doctor_app/features/patients/domain/entities/patient_entity.dart';
import 'package:doctor_app/features/patients/domain/repositories/patient_repository.dart';
import 'package:equatable/equatable.dart';

class UpdatePatientUseCase {
  final PatientRepository patientRepository;

  UpdatePatientUseCase({required this.patientRepository});

  Future<void> call({required UpdatePatientParams params}) async {
    try {
      await patientRepository.updatePatient(patient: params.patient);
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}

class UpdatePatientParams extends Equatable {
  final PatientEntity patient;

  const UpdatePatientParams({required this.patient});

  @override
  List<Object> get props => [patient];
}