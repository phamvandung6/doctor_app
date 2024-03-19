import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/treatment/domain/repositories/tpn_repository.dart';
import 'package:equatable/equatable.dart';

class UpdatePassingCountUseCase {
  final TpnRepository tpnRepository;

  UpdatePassingCountUseCase({required this.tpnRepository});

  Future<void> call({
    required UpdatePassingCountParams params,
  }) async {
    try {
      await tpnRepository.updatePassingCount(
        regimenEntity: params.regimenEntity,
      );
    } on ArgumentError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}

class UpdatePassingCountParams extends Equatable {
  final RegimenEntity regimenEntity;

  const UpdatePassingCountParams({required this.regimenEntity});

  @override
  List<Object> get props => [regimenEntity];
}
