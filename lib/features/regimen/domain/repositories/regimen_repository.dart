import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';

abstract class RegimenRepository {
  Stream<List<RegimenEntity>> getRegimens({
    required String patientId,
  });

  Future<void> deleteRegimen({
    required RegimenEntity regimen,
  });

  Future<void> createRegimen({
    required RegimenEntity regimen,
  });
}