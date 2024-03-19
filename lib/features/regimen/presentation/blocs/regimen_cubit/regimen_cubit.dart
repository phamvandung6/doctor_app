import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/regimen/domain/usecases/create_regimen_use_case.dart';
import 'package:doctor_app/features/regimen/domain/usecases/delete_regimen_use_case.dart';
import 'package:doctor_app/features/regimen/domain/usecases/get_regimens_use_case.dart';
import 'package:equatable/equatable.dart';

part 'regimen_state.dart';

class RegimenCubit extends Cubit<RegimenState> {
  RegimenCubit({
    required this.createRegimenUseCase,
    required this.deleteRegimenUseCase,
    required this.getRegimensUseCase,
  }) : super(RegimenInitial());

  final CreateRegimenUseCase createRegimenUseCase;
  final DeleteRegimenUseCase deleteRegimenUseCase;
  final GetRegimensUseCase getRegimensUseCase;

  Future<void> fetchRegimens({required String patientId}) async {
    emit(RegimenLoading());
    try {
      final regimens = getRegimensUseCase.call(
          params: GetRegimensParams(patientId: patientId));
      emit(RegimenLoaded(regimens: regimens));
    } catch (e) {
      emit(RegimenError(message: e.toString()));
    }
  }

  Future<void> createRegimen({required RegimenEntity regimen}) async {
    emit(RegimenLoading());
    try {
      await createRegimenUseCase.call(
          params: CreateRegimenParams(regimen: regimen));
      final regimens = getRegimensUseCase.call(
          params: GetRegimensParams(patientId: regimen.patientId));
      emit(RegimenLoaded(regimens: regimens));
    } catch (e) {
      emit(RegimenError(message: e.toString()));
    }
  }

  Future<void> deleteRegimen({required RegimenEntity regimen}) async {
    emit(RegimenLoading());
    try {
      await deleteRegimenUseCase.call(
          params: DeleteRegimenParams(regimen: regimen));
      final regimens = getRegimensUseCase.call(
          params: GetRegimensParams(patientId: regimen.patientId));
      emit(RegimenLoaded(regimens: regimens));
    } catch (e) {
      emit(RegimenError(message: e.toString()));
    }
  }
}
