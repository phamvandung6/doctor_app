import 'package:doctor_app/features/regimen/data/models/regimen_model.dart';
import 'package:doctor_app/features/treatment/domain/object/medical_check_glucose.dart';
import 'package:doctor_app/features/treatment/domain/object/medical_take_insullin.dart';

abstract class TpnRemoteDataSource {
  Future<void> addMedicalCheckGlucose({
    required MedicalCheckGlucose medicalCheckGlucose,
    required RegimenModel regimenModel,
  });

  Future<void> addMedicalTakeInsulin({
    required MedicalTakeInsulin medicalTakeInsulin,
    required RegimenModel regimenModel,
  });

  Future<void> updateDescription({
    required String description,
    required RegimenModel regimenModel,
    required String tpnType,
    required String tpnStep,
  });

  Future<String> getTpnStep({
    required RegimenModel regimenModel,
  });

  Future<void> createTpnTreatment({
    required RegimenModel regimenModel,
  });

   Future<num> getPassingCount({
    required RegimenModel regimenModel,
  });

  Future<num> getUnpassingCount({
    required RegimenModel regimenModel,
  });

  Future<void> updatePassingCount({
    required RegimenModel regimenModel,
  });

  Future<void> updateUnpassingCount({
    required RegimenModel regimenModel,
  });

  Future<List<dynamic>> getTpnHistory({
    required RegimenModel regimenModel,
  });
}
