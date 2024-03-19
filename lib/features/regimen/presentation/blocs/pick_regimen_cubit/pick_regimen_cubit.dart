import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:equatable/equatable.dart';

part 'pick_regimen_state.dart';

class PickRegimenCubit extends Cubit<PickRegimenState> {
  PickRegimenCubit()
      : super(const PickRegimenState(RegimenEntity(patientId: '0')));

  Future<void> pickRegimen({required RegimenEntity regimen}) async {
    try {
      emit(PickRegimenState(regimen));
    } catch (e) {
      print(e);
    }
  }
}
