import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/treatment/domain/repositories/tpn_repository.dart';
import 'package:equatable/equatable.dart';

class GetUnpassingCountUseCase {
  final TpnRepository tpnRepository;

  GetUnpassingCountUseCase({required this.tpnRepository});

  Future<num> call({
    required GetUnpassingCountParams params,
  }) async {
    try {
      return await tpnRepository.getUnpassingCount(
        regimenEntity: params.regimenEntity,
      );
    } on ArgumentError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}

class GetUnpassingCountParams extends Equatable {
  final RegimenEntity regimenEntity;

  const GetUnpassingCountParams({required this.regimenEntity});

  @override
  List<Object> get props => [regimenEntity];
}
