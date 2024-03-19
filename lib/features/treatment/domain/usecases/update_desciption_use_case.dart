import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/treatment/domain/repositories/tpn_repository.dart';
import 'package:equatable/equatable.dart';

class TpnUpdateDescriptionUseCase {
  final TpnRepository tpnRepository;

  TpnUpdateDescriptionUseCase({required this.tpnRepository});

  Future<void> call({
    required TpnUpdateDescriptionParams params,
  }) async {
    try {
      await tpnRepository.updateDescription(
        description: params.description,
        regimenEntity: params.regimenEntity,
        tpnType: params.tpnType,
        tpnStep: params.tpnStep,
      );
    } on ArgumentError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}

class TpnUpdateDescriptionParams extends Equatable {
  final String description;
  final RegimenEntity regimenEntity;
  final String tpnType;
  final String tpnStep;

  const TpnUpdateDescriptionParams({
    required this.description,
    required this.regimenEntity,
    required this.tpnType,
    required this.tpnStep,
  });

  @override
  List<Object?> get props => [description, regimenEntity, tpnType, tpnStep];
}
