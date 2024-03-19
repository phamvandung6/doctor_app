import 'package:doctor_app/features/patients/domain/repositories/patient_repository.dart';
import 'package:equatable/equatable.dart';

class DeletePatientUseCase {
  final PatientRepository patientRepository;
  DeletePatientUseCase({required this.patientRepository});

  Future<void> call({required DeletePatientParams params}) async {
    try {
      await patientRepository.deletePatient(id: params.id);
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}

class DeletePatientParams extends Equatable {
  final String id;

  const DeletePatientParams({required this.id});

  @override
  List<Object?> get props => [id];
}
