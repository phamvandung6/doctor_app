import 'package:doctor_app/features/regimen/data/datasources/regimen_remote_data_source.dart';
import 'package:doctor_app/features/regimen/data/models/regimen_model.dart';
import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/regimen/domain/repositories/regimen_repository.dart';

class RegimenRepositoryImpl implements RegimenRepository {
  final RegimenRemoteDataSource remoteDataSource;

  RegimenRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> createRegimen({required RegimenEntity regimen}) async =>
      await remoteDataSource.createRegimen(
          regimen: RegimenModel.fromEntity(regimen));

  @override
  Future<void> deleteRegimen({required RegimenEntity regimen}) async =>
      await remoteDataSource.deleteRegimen(
          regimen: RegimenModel.fromEntity(regimen));

  @override
  Stream<List<RegimenEntity>> getRegimens({required String patientId}) =>
      remoteDataSource.getRegimens(patientId: patientId);
}
