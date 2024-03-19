import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/regimen/domain/repositories/regimen_repository.dart';
import 'package:equatable/equatable.dart';

class DeleteRegimenUseCase {
  final RegimenRepository regimenRepository;

  DeleteRegimenUseCase({
    required this.regimenRepository,
  });

  Future<void> call({
    required DeleteRegimenParams params,
  }) async {
    try {
      await regimenRepository.deleteRegimen(regimen: params.regimen);
    } on ArgumentError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

class DeleteRegimenParams extends Equatable {
  final RegimenEntity regimen;

  const DeleteRegimenParams({
    required this.regimen,
  });

  @override
  List<Object> get props => [regimen];
}
