import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/treatment/domain/repositories/tpn_repository.dart';
import 'package:equatable/equatable.dart';

class GetTpnHistoryUseCase {
  final TpnRepository tpnRepository;

  GetTpnHistoryUseCase({required this.tpnRepository});

  Future<List<dynamic>> call({
    required GetTpnHistoryParams params,
  }) {
    return tpnRepository.getTpnHistory(regimenEntity: params.regimenEntity);
  }
}

class GetTpnHistoryParams extends Equatable {
  final RegimenEntity regimenEntity;

  const GetTpnHistoryParams({
    required this.regimenEntity,
  });

  @override
  List<Object> get props => [regimenEntity];
}
