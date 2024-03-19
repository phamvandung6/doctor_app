import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_time_state.dart';

class CheckTimeCubit extends Cubit<CheckTimeState> {
  CheckTimeCubit() : super(CheckTimeInitial());

  void checkTime() {
    final now = DateTime.now();
    if (now.hour == 5 && now.minute >= 30 && now.minute < 60) {
      emit(CheckTimeSuccess());
    } else if (now.hour == 11 && now.minute >= 30 && now.minute < 60) {
      emit(CheckTimeSuccess());
    } else if (now.hour == 17 && now.minute >= 30 && now.minute < 60) {
      emit(CheckTimeSuccess());
    } else if (now.hour == 21 && now.minute >= 30 && now.minute < 60) {
      emit(CheckTimeSuccess());
    } else {
      if (now.hour >= 0 && now.hour < 5) {
      } else if (now.hour >= 6 &&
          now.hour < 11 &&
          (now.hour != 11 || now.minute < 30)) {
        emit(const CheckTimeFailed(message: "Vui lòng đợi đến 11h30"));
      } else if (now.hour >= 12 &&
          now.hour < 17 &&
          (now.hour != 17 || now.minute < 30)) {
        emit(const CheckTimeFailed(message: "Vui lòng đợi đến 17h30"));
      } else if (now.hour >= 18 &&
          now.hour < 21 &&
          (now.hour != 21 || now.minute < 30)) {
        emit(const CheckTimeFailed(message: "Vui lòng đợi đến 21h30"));
      } else if ((now.hour > 22 || now.hour < 5) ||
          (now.hour == 22 && now.minute >= 0) ||
          (now.hour == 5 && now.minute < 30)) {
        emit(const CheckTimeFailed(message: "Vui bạn đợi đến 5h30"));
      } else {
        emit(const CheckTimeFailed(
            message: "Vui lòng đợi đến khung giờ tiếp theo"));
      }
    }
  }
}
