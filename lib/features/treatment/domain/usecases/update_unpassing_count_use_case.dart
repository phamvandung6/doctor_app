import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/treatment/domain/repositories/tpn_repository.dart';
import 'package:equatable/equatable.dart';

class UpdateUnpassingCountUseCase {
  final TpnRepository tpnRepository;

  UpdateUnpassingCountUseCase({required this.tpnRepository});

  Future<void> call({
    required UpdateUnpassingCountParams params,
  }) async {
    try {
      await tpnRepository.updateUnpassingCount(
        regimenEntity: params.regimenEntity,
      );
    } on ArgumentError catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}

class UpdateUnpassingCountParams extends Equatable {
  final RegimenEntity regimenEntity;

  const UpdateUnpassingCountParams({required this.regimenEntity});

  @override
  List<Object> get props => [regimenEntity];
}
