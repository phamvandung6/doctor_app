import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/core/utils/functions/convert_time.dart';
import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/treatment/domain/object/medical_check_glucose.dart';
import 'package:doctor_app/features/treatment/domain/usecases/add_medical_check_glucose_use_case.dart';
import 'package:doctor_app/features/treatment/domain/usecases/add_medical_take_insulin_use_case.dart';
import 'package:doctor_app/features/treatment/domain/usecases/create_tpn_treatment_use_case.dart';
import 'package:doctor_app/features/treatment/domain/usecases/get_passing_count_use_case.dart';
import 'package:doctor_app/features/treatment/domain/usecases/get_tpn_step_use_case.dart';
import 'package:doctor_app/features/treatment/domain/usecases/get_unpassing_count.dart';
import 'package:doctor_app/features/treatment/domain/usecases/update_desciption_use_case.dart';
import 'package:doctor_app/features/treatment/domain/usecases/update_passing_count_use_case.dart';
import 'package:doctor_app/features/treatment/domain/usecases/update_unpassing_count_use_case.dart';
import 'package:equatable/equatable.dart';

part 'tpn_state.dart';

class TpnCubit extends Cubit<TpnState> {
  TpnCubit({
    required this.addMedicalCheckGlucoseUseCase,
    required this.addMedicalTakeInsulinUseCase,
    required this.tpnUpdateDescriptionUseCase,
    required this.getTpnStepUseCase,
    required this.createTpnTreatmentUseCase,
    required this.getPassingCountUseCase,
    required this.getUnpassingCountUseCase,
    required this.updatePassingCountUseCase,
    required this.updateUnpassingCountUseCase,
    // required this.getTpnHistoryUseCase,
  }) : super(TpnInitial());

  final AddMedicalCheckGlucoseUseCase addMedicalCheckGlucoseUseCase;
  final AddMedicalTakeInsulinUseCase addMedicalTakeInsulinUseCase;
  final TpnUpdateDescriptionUseCase tpnUpdateDescriptionUseCase;
  final GetTpnStepUseCase getTpnStepUseCase;
  final CreateTpnTreatmentUseCase createTpnTreatmentUseCase;
  final GetPassingCountUseCase getPassingCountUseCase;
  final GetUnpassingCountUseCase getUnpassingCountUseCase;
  final UpdatePassingCountUseCase updatePassingCountUseCase;
  final UpdateUnpassingCountUseCase updateUnpassingCountUseCase;
  // final GetTpnHistoryUseCase getTpnHistoryUseCase;

  Future<String> _getTypeInsulin({required RegimenEntity regimenEntity}) async {
    try {
      final DocumentReference reference = FirebaseFirestore.instance
          .collection('regimens')
          .doc(timestampToDateTime(regimenEntity.beginTime!).toString())
          .collection('treatment')
          .doc('treatment');

      final DocumentSnapshot documentSnapshot = await reference.get();

      return documentSnapshot.get('tpnType');
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> updateTpnStep({
    required String tpnStep,
    required RegimenEntity regimenEntity,
  }) async {
    try {
      final DocumentReference reference = FirebaseFirestore.instance
          .collection('regimens')
          .doc(timestampToDateTime(regimenEntity.beginTime!).toString())
          .collection('treatment')
          .doc('treatment');

      return reference.update({'step': tpnStep});
    } catch (e) {
      emit(TpnError(message: e.toString()));
    }
  }

  Future<void> getTpnStep({required RegimenEntity regimenEntity}) async {
    try {
      final step = await getTpnStepUseCase.call(
          params: GetTpnStepParams(regimenEntity: regimenEntity));
      if (step == 'step1') {
        emit(TpnStep1State());
      } else if (step == 'step2') {
        final typeInsulin = await _getTypeInsulin(regimenEntity: regimenEntity);
        emit(TpnStep2State(typeInsulin: typeInsulin));
      } else if (step == 'step3') {
        emit(TpnStep3State());
      }
    } catch (e) {
      emit(TpnError(message: e.toString()));
    }
  }

  Future<void> submitStep1({
    required String description,
    required RegimenEntity regimen,
    required String tpnType,
    required String tpnStep,
  }) async {
    try {
      await tpnUpdateDescriptionUseCase.call(
          params: TpnUpdateDescriptionParams(
        description: description,
        regimenEntity: regimen,
        tpnType: tpnType,
        tpnStep: tpnStep,
      ));
      emit(TpnStep2State(typeInsulin: tpnType));
    } catch (e) {
      emit(TpnError(message: e.toString()));
    }
  }

  Future<void> doneRegimen() async {
    try {
      emit(TpnStep3State());
    } catch (e) {
      emit(TpnError(message: e.toString()));
    }
  }

  Future<void> createTpnModel({
    required RegimenEntity regimen,
  }) async {
    try {
      await createTpnTreatmentUseCase.call(
          params: CreateTpnTreatmentParams(regimenEntity: regimen));
    } catch (e) {
      emit(TpnError(message: e.toString()));
    }
  }

  Future<void> addMedicalCheckGlucose({
    required MedicalCheckGlucose medicalCheckGlucose,
    required RegimenEntity regimenEntity,
  }) async {
    try {
      await addMedicalCheckGlucoseUseCase.call(
          params: AddMedicalCheckGlucoseParams(
        medicalCheckGlucose: medicalCheckGlucose,
        regimenEntity: regimenEntity,
      ));
    } catch (e) {
      emit(TpnError(message: e.toString()));
    }
  }

  //get passing count
  Future<num> getPassingCount({required RegimenEntity regimenEntity}) async {
    try {
      final count = await getPassingCountUseCase.call(
          params: GetPassingCountParams(regimenEntity: regimenEntity));

      return count;
    } catch (e) {
      throw e.toString();
    }
  }
  //get unpassing count

  Future<num> getUnpassingCount({required RegimenEntity regimenEntity}) async {
    try {
      final count = await getUnpassingCountUseCase.call(
          params: GetUnpassingCountParams(regimenEntity: regimenEntity));
      return count;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> updatePassingCount({
    required RegimenEntity regimenEntity,
  }) async {
    try {
      await updatePassingCountUseCase.call(
          params: UpdatePassingCountParams(regimenEntity: regimenEntity));
    } catch (e) {
      emit(TpnError(message: e.toString()));
    }
  }

  Future<void> updateUnpassingCount({
    required RegimenEntity regimenEntity,
  }) async {
    try {
      await updateUnpassingCountUseCase.call(
          params: UpdateUnpassingCountParams(regimenEntity: regimenEntity));
    } catch (e) {
      emit(TpnError(message: e.toString()));
    }
  }
}
