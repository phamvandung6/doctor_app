part of 'patient_cubit.dart';

sealed class PatientState extends Equatable {
  const PatientState();

  @override
  List<Object> get props => [];
}

final class PatientInitial extends PatientState {}

final class PatientLoading extends PatientState {}

final class PatientLoaded extends PatientState {
  final Stream<List<PatientEntity>>? patients;
  final Future<List<PatientEntity>>? patientsFuture;

  const PatientLoaded({this.patients, this.patientsFuture});

  @override
  List<Object> get props => [patients!, patientsFuture!];
}

final class PatientError extends PatientState {
  final String message;

  const PatientError({required this.message});

  @override
  List<Object> get props => [message];
}