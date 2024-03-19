import 'package:doctor_app/features/regimen/data/models/regimen_model.dart';
import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/treatment/data/datasources/tpn_remote_data_source.dart';
import 'package:doctor_app/features/treatment/domain/object/medical_check_glucose.dart';
import 'package:doctor_app/features/treatment/domain/object/medical_take_insullin.dart';
import 'package:doctor_app/features/treatment/domain/repositories/tpn_repository.dart';

class TpnRepositoryImpl implements TpnRepository {
  final TpnRemoteDataSource tpnRemoteDataSource;

  TpnRepositoryImpl({required this.tpnRemoteDataSource});

  @override
  Future<void> addMedicalCheckGlucose({
    required MedicalCheckGlucose medicalCheckGlucose,
    required RegimenEntity regimenEntity,
  }) async =>
      await tpnRemoteDataSource.addMedicalCheckGlucose(
        medicalCheckGlucose: medicalCheckGlucose,
        regimenModel: RegimenModel.fromEntity(regimenEntity),
      );

  @override
  Future<void> addMedicalTakeInsulin({
    required MedicalTakeInsulin medicalTakeInsulin,
    required RegimenEntity regimenEntity,
  }) async =>
      await tpnRemoteDataSource.addMedicalTakeInsulin(
        medicalTakeInsulin: medicalTakeInsulin,
        regimenModel: RegimenModel.fromEntity(regimenEntity),
      );

  @override
  Future<void> updateDescription({
    required String description,
    required RegimenEntity regimenEntity,
    required String tpnType,
    required String tpnStep,
  }) async =>
      await tpnRemoteDataSource.updateDescription(
        description: description,
        regimenModel: RegimenModel.fromEntity(regimenEntity),
        tpnType: tpnType,
        tpnStep: tpnStep,
      );

  @override
  Future<String> getTpnStep({required RegimenEntity regimenEntity}) async =>
      await tpnRemoteDataSource.getTpnStep(
        regimenModel: RegimenModel.fromEntity(regimenEntity),
      );

  @override
  Future<void> createTpnTreatment({
    required RegimenEntity regimenEntity,
  }) async =>
      await tpnRemoteDataSource.createTpnTreatment(
        regimenModel: RegimenModel.fromEntity(regimenEntity),
      );

  @override
  Future<num> getPassingCount({required RegimenEntity regimenEntity}) async =>
      await tpnRemoteDataSource.getPassingCount(
        regimenModel: RegimenModel.fromEntity(regimenEntity),
      );

  @override
  Future<num> getUnpassingCount({required RegimenEntity regimenEntity}) async =>
      await tpnRemoteDataSource.getUnpassingCount(
        regimenModel: RegimenModel.fromEntity(regimenEntity),
      );

  @override
  Future<void> updatePassingCount(
          {required RegimenEntity regimenEntity}) async =>
      await tpnRemoteDataSource.updatePassingCount(
        regimenModel: RegimenModel.fromEntity(regimenEntity),
      );

  @override
  Future<void> updateUnpassingCount(
          {required RegimenEntity regimenEntity}) async =>
      await tpnRemoteDataSource.updateUnpassingCount(
        regimenModel: RegimenModel.fromEntity(regimenEntity),
      );

  @override
  Future<List<dynamic>> getTpnHistory({required RegimenEntity regimenEntity}) {
    return tpnRemoteDataSource.getTpnHistory(
        regimenModel: RegimenModel.fromEntity(regimenEntity));
  }
}
