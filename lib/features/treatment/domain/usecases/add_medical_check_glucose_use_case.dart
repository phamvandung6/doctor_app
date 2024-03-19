import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/treatment/domain/object/medical_check_glucose.dart';
import 'package:doctor_app/features/treatment/domain/repositories/tpn_repository.dart';
import 'package:equatable/equatable.dart';

class AddMedicalCheckGlucoseUseCase {
  final TpnRepository tpnRepository;

  AddMedicalCheckGlucoseUseCase({required this.tpnRepository});

  Future<void> call({
    required AddMedicalCheckGlucoseParams params,
  }) async {
    try {
      await tpnRepository.addMedicalCheckGlucose(
        medicalCheckGlucose: params.medicalCheckGlucose,
        regimenEntity: params.regimenEntity,
      );
    } on ArgumentError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}

class AddMedicalCheckGlucoseParams extends Equatable {
  final MedicalCheckGlucose medicalCheckGlucose;
  final RegimenEntity regimenEntity;

  const AddMedicalCheckGlucoseParams({
    required this.medicalCheckGlucose,
    required this.regimenEntity,
  });

  @override
  List<Object?> get props => [medicalCheckGlucose, regimenEntity];
}
