import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/regimen/domain/repositories/regimen_repository.dart';
import 'package:equatable/equatable.dart';

class CreateRegimenUseCase {
  final RegimenRepository regimenRepository;

  CreateRegimenUseCase({
    required this.regimenRepository,
  });

  Future<void> call({
    required CreateRegimenParams params,
  }) async {
    try {
      await regimenRepository.createRegimen(regimen: params.regimen);
    } on ArgumentError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

class CreateRegimenParams extends Equatable {
  final RegimenEntity regimen;

  const CreateRegimenParams({
    required this.regimen,
  });

  @override
  List<Object> get props => [regimen];
}
