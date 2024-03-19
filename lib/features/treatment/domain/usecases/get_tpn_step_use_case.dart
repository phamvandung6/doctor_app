import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/treatment/domain/repositories/tpn_repository.dart';
import 'package:equatable/equatable.dart';

class GetTpnStepUseCase {
  final TpnRepository tpnRepository;

  const GetTpnStepUseCase({
    required this.tpnRepository,
  });

  Future<String> call({
    required GetTpnStepParams params,
  }) async {
    try {
      return await tpnRepository.getTpnStep(
        regimenEntity: params.regimenEntity,
      );
    } on ArgumentError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}

class GetTpnStepParams extends Equatable {
  final RegimenEntity regimenEntity;

  const GetTpnStepParams({
    required this.regimenEntity,
  });

  @override
  List<Object> get props => [regimenEntity];
}
