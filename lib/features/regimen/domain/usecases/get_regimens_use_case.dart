import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/regimen/domain/repositories/regimen_repository.dart';
import 'package:equatable/equatable.dart';

class GetRegimensUseCase {
  final RegimenRepository regimenRepository;

  GetRegimensUseCase({
    required this.regimenRepository,
  });

  Stream<List<RegimenEntity>> call({
    required GetRegimensParams params,
  }) {
    try {
      return regimenRepository.getRegimens(patientId: params.patientId);
    } on ArgumentError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

class GetRegimensParams extends Equatable {
  final String patientId;

  const GetRegimensParams({
    required this.patientId,
  });

  @override
  List<Object> get props => [patientId];
}
