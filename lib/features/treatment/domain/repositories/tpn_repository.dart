import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/treatment/domain/object/medical_check_glucose.dart';
import 'package:doctor_app/features/treatment/domain/object/medical_take_insullin.dart';

abstract class TpnRepository {
  Future<void> addMedicalCheckGlucose({
    required MedicalCheckGlucose medicalCheckGlucose,
    required RegimenEntity regimenEntity,
  });

  Future<void> addMedicalTakeInsulin({
    required MedicalTakeInsulin medicalTakeInsulin,
    required RegimenEntity regimenEntity,
  });

  Future<void> updateDescription({
    required String description,
    required RegimenEntity regimenEntity,
    required String tpnType,
    required String tpnStep,
  });

  Future<String> getTpnStep({
    required RegimenEntity regimenEntity,
  });

  Future<void> createTpnTreatment({
    required RegimenEntity regimenEntity,
  });

  //get passing count
  Future<num> getPassingCount({
    required RegimenEntity regimenEntity,
  });

  Future<num> getUnpassingCount({
    required RegimenEntity regimenEntity,
  });

  Future<void> updatePassingCount({
    required RegimenEntity regimenEntity,
  });

  Future<void> updateUnpassingCount({
    required RegimenEntity regimenEntity,
  });
  
  Future<List<dynamic>> getTpnHistory({
    required RegimenEntity regimenEntity,
  });
}
