part of 'pick_patient_cubit.dart';

final class PickPatientState extends Equatable {
  final PatientEntity patient;
  const PickPatientState(this.patient);

  @override
  List<Object> get props => [patient];
}
