import 'package:doctor_app/features/patients/domain/entities/patient_entity.dart';
import 'package:doctor_app/features/patients/domain/repositories/patient_repository.dart';
import 'package:equatable/equatable.dart';

class GetPatientsUseCase {
  final PatientRepository patientRepository;
  GetPatientsUseCase({required this.patientRepository});

  Stream<List<PatientEntity>> call({required GetPatientsParams params}) {
    try {
      return patientRepository.getPatients(roomId: params.roomId);
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}

class GetPatientsParams extends Equatable {
  final String roomId;
  const GetPatientsParams({required this.roomId});

  @override
  List<Object> get props => [roomId];
}
