import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/core/utils/functions/convert_time.dart';
import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:equatable/equatable.dart';

part 'check_glucose_on_time_state.dart';

// Cubit này nhằm kiểm tra xem mình đã add medical checkglucose chưa, nếu chưa thì cho người dùng đo glucose, không thì thông báo là
// bệnh nhân đã đo glucose rồi
class CheckGlucoseOnTimeCubit extends Cubit<CheckGlucoseOnTimeState> {
  CheckGlucoseOnTimeCubit() : super(CheckGlucoseOnTimeInitial());

  void isCheckGlucoseOnTime({required RegimenEntity regimen}) async {
    try {
      final DocumentReference reference = FirebaseFirestore.instance
          .collection('regimens')
          .doc(timestampToDateTime(regimen.beginTime!).toString())
          .collection('treatment')
          .doc('treatment');

      final DocumentSnapshot documentSnapshot = await reference.get();

      final List<dynamic> medicalActions =
          documentSnapshot.get('medicalActions');
      final Map<String, dynamic>? lastMedicalAction =
          medicalActions.isNotEmpty ? medicalActions.last : null;

      if (lastMedicalAction != null) {
        final Timestamp time = lastMedicalAction['time'];

        DateTime dateTime = time.toDate();
        Duration difference = DateTime.now().difference(dateTime);

        if (difference.inMinutes > 45) {
          emit(GlucoseChecking());
        } else {
          emit(GlucoseWaitingTime());
        }
      }
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
