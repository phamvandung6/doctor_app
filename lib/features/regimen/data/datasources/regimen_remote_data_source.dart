import 'package:doctor_app/features/regimen/data/models/regimen_model.dart';

abstract class RegimenRemoteDataSource {
  Stream<List<RegimenModel>> getRegimens({
    required String patientId,
  });
  Future<void> deleteRegimen({
    required RegimenModel regimen,
  });
  Future<void> createRegimen({
    required RegimenModel regimen,
  });
}
