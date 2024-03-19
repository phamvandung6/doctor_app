import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/treatment/domain/object/medical_take_insullin.dart';
import 'package:doctor_app/features/treatment/domain/repositories/tpn_repository.dart';
import 'package:equatable/equatable.dart';

class AddMedicalTakeInsulinUseCase {
  final TpnRepository tpnRepository;

  AddMedicalTakeInsulinUseCase({
    required this.tpnRepository,
  });

  Future<void> call({
    required AddMedicalTakeInsulinParams params,
    required RegimenEntity regimenEntity,
  }) async {
    try {
      await tpnRepository.addMedicalTakeInsulin(
        medicalTakeInsulin: params.medicalTakeInsulin,
        regimenEntity: regimenEntity,
      );
    } on ArgumentError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}

class AddMedicalTakeInsulinParams extends Equatable {
  final MedicalTakeInsulin medicalTakeInsulin;

  const AddMedicalTakeInsulinParams({
    required this.medicalTakeInsulin,
  });

  @override
  List<Object> get props => [medicalTakeInsulin];
}
