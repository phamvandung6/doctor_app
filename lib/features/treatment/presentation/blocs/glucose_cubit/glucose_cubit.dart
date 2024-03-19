import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'glucose_state.dart';

class GlucoseCubit extends Cubit<GlucoseState> {
  GlucoseCubit() : super(GlucoseInitial());

  void checkGlucose({required num glucose}) {
    if (glucose >= 3.9 && glucose <= 8.3) {
      emit(GlucoseLow());
    } else if (glucose > 8.3 && glucose <= 11.1) {
      emit(GlucoseMedium());
    } else if (glucose > 11.1) {
      emit(GlucoseHigh());
    }
  }
}
