import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/patients/domain/entities/patient_entity.dart';
import 'package:doctor_app/features/patients/domain/usecases/create_patient_use_case.dart';
import 'package:doctor_app/features/patients/domain/usecases/delete_patient_use_case.dart';
import 'package:doctor_app/features/patients/domain/usecases/get_patient_by_id_use_case.dart';
import 'package:doctor_app/features/patients/domain/usecases/get_patients_use_case.dart';
import 'package:doctor_app/features/patients/domain/usecases/update_patient_use_case.dart';
import 'package:equatable/equatable.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit({
    required this.getPatientByIdUseCase,
    required this.getPatientsUseCase,
    required this.createPatientUseCase,
    required this.deletePatientUseCase,
    required this.updatePatientUseCase,
  }) : super(PatientInitial());

  final GetPatientByIdUseCase getPatientByIdUseCase;
  final GetPatientsUseCase getPatientsUseCase;
  final CreatePatientUseCase createPatientUseCase;
  final DeletePatientUseCase deletePatientUseCase;
  final UpdatePatientUseCase updatePatientUseCase;

  Future<void> getPatientById({required String id}) async {
    try {
      emit(PatientLoading());
      final patients =
          getPatientByIdUseCase.call(params: GetPatientByIdParams(id: id));
      emit(PatientLoaded(patientsFuture: patients));
    } catch (e) {
      emit(PatientError(message: e.toString()));
    }
  }

  Future<void> fetchPatients({required String roomId}) async {
    try {
      emit(PatientLoading());
      final patients =
          getPatientsUseCase.call(params: GetPatientsParams(roomId: roomId));
      emit(PatientLoaded(patients: patients));
    } catch (e) {
      emit(PatientError(message: e.toString()));
    }
  }

  Future<void> createPatient({required PatientEntity patient}) async {
    try {
      emit(PatientLoading());
      await createPatientUseCase.call(
          params: CreatePatientParams(patient: patient));
      final patients = getPatientsUseCase.call(
          params: GetPatientsParams(roomId: patient.room!));
      emit(PatientLoaded(patients: patients));
    } catch (e) {
      emit(PatientError(message: e.toString()));
    }
  }

  Future<void> updatePatient({required PatientEntity patient}) async {
    try {
      emit(PatientLoading());
      await updatePatientUseCase.call(
          params: UpdatePatientParams(patient: patient));
      final patients = getPatientsUseCase.call(
          params: GetPatientsParams(roomId: patient.room!));
      emit(PatientLoaded(patients: patients));
    } catch (e) {
      emit(PatientError(message: e.toString()));
    }
  }

  Future<void> deletePatient({required PatientEntity patient}) async {
    try {
      emit(PatientLoading());
      await deletePatientUseCase.call(params: DeletePatientParams(id: patient.id!));
      final patients = getPatientsUseCase.call(params: GetPatientsParams(roomId: patient.room!));
      emit(PatientLoaded(patients: patients));
    } catch (e) {
      emit(PatientError(message: e.toString()));
    }
  }

  
}
