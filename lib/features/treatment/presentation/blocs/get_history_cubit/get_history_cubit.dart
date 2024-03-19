import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/treatment/domain/usecases/get_tpn_history_use_case.dart';
import 'package:equatable/equatable.dart';

part 'get_history_state.dart';

class GetHistoryCubit extends Cubit<GetHistoryState> {
  GetHistoryCubit({
    required this.getTpnHistoryUseCase,
  }) : super(GetHistoryInitial());

  final GetTpnHistoryUseCase getTpnHistoryUseCase;

  Future<void> getTpnHistory({required RegimenEntity regimenEntity}) async {
    try {
      final history = await getTpnHistoryUseCase.call(
          params: GetTpnHistoryParams(regimenEntity: regimenEntity));

      emit(GetTpnHistorySuccess(history));
    } catch (e) {
      emit(GetHistoryError(message: e.toString()));
    }
  }
}
