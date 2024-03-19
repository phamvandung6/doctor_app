import 'package:doctor_app/features/patients/domain/entities/patient_entity.dart';
import 'package:doctor_app/features/patients/domain/repositories/patient_repository.dart';
import 'package:equatable/equatable.dart';

class GetPatientByIdUseCase {
  final PatientRepository patientRepository;
  GetPatientByIdUseCase({required this.patientRepository});

  Future<List<PatientEntity>> call({required GetPatientByIdParams params}) {
    try {
      return patientRepository.getPatientById(id: params.id);
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}

class GetPatientByIdParams extends Equatable {
  final String id;

  const GetPatientByIdParams({required this.id});

  @override
  List<Object> get props => [id];
}
