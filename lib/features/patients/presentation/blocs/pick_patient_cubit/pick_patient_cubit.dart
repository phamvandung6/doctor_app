import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/patients/domain/entities/patient_entity.dart';
import 'package:equatable/equatable.dart';

part 'pick_patient_state.dart';

class PickPatientCubit extends Cubit<PickPatientState> {
  PickPatientCubit() : super(const PickPatientState(PatientEntity(id: '')));

  void pickPatient({required PatientEntity patient}) {
    try {
      emit(PickPatientState(patient));
    } catch (e) {
      print(e);
    }
  }
}
