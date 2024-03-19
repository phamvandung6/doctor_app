import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/treatment/domain/repositories/tpn_repository.dart';
import 'package:equatable/equatable.dart';

class CreateTpnTreatmentUseCase {
  final TpnRepository tpnRepository;

  CreateTpnTreatmentUseCase({required this.tpnRepository});

  Future<void> call({
    required CreateTpnTreatmentParams params,
  }) async {
    try {
      await tpnRepository.createTpnTreatment(
        regimenEntity: params.regimenEntity,
      );
    } on ArgumentError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}

class CreateTpnTreatmentParams extends Equatable {
  final RegimenEntity regimenEntity;

  const CreateTpnTreatmentParams({
    required this.regimenEntity,
  });

  @override
  List<Object?> get props => [regimenEntity];
}
