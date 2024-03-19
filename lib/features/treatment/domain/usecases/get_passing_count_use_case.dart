import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/treatment/domain/repositories/tpn_repository.dart';
import 'package:equatable/equatable.dart';

class GetPassingCountUseCase {
  final TpnRepository tpnRepository;

  GetPassingCountUseCase({required this.tpnRepository});

  Future<num> call({
    required GetPassingCountParams params,
  }) async {
    try {
      return await tpnRepository.getPassingCount(
        regimenEntity: params.regimenEntity,
      );
    } on ArgumentError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}

class GetPassingCountParams extends Equatable {
  final RegimenEntity regimenEntity;

  const GetPassingCountParams({required this.regimenEntity});

  @override
  List<Object> get props => [regimenEntity];
}
