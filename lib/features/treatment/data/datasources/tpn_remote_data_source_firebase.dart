import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/core/utils/functions/convert_time.dart';
import 'package:doctor_app/features/regimen/data/models/regimen_model.dart';
import 'package:doctor_app/features/treatment/data/datasources/tpn_remote_data_source.dart';
import 'package:doctor_app/features/treatment/data/models/tpn_model.dart';
import 'package:doctor_app/features/treatment/domain/object/medical_check_glucose.dart';
import 'package:doctor_app/features/treatment/domain/object/medical_take_insullin.dart';

class TpnRemoteDataSourceFirebase implements TpnRemoteDataSource {
  final FirebaseFirestore firestore;

  TpnRemoteDataSourceFirebase({required this.firestore});
  @override
  Future<void> addMedicalCheckGlucose({
    required MedicalCheckGlucose medicalCheckGlucose,
    required RegimenModel regimenModel,
  }) async {
    try {
      final DocumentReference reference = firestore
          .collection('regimens')
          .doc(timestampToDateTime(regimenModel.beginTime!).toString())
          .collection('treatment')
          .doc('treatment');
      await reference.update({
        'medicalActions': FieldValue.arrayUnion([medicalCheckGlucose.toJson()])
      });
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> addMedicalTakeInsulin({
    required MedicalTakeInsulin medicalTakeInsulin,
    required RegimenModel regimenModel,
  }) async {
    try {
      final DocumentReference reference = firestore
          .collection('regimens')
          .doc(timestampToDateTime(regimenModel.beginTime!).toString())
          .collection('treatment')
          .doc('treatment');

      await reference.update({
        'medicalActions': FieldValue.arrayUnion([medicalTakeInsulin.toJson()])
      });
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateDescription({
    required String description,
    required RegimenModel regimenModel,
    required String tpnType,
    required String tpnStep,
  }) async {
    try {
      final DocumentReference reference = firestore
          .collection('regimens')
          .doc(timestampToDateTime(regimenModel.beginTime!).toString())
          .collection('treatment')
          .doc('treatment');

      await reference.update({
        'description': description,
        'tpnType': tpnType,
        'step': tpnStep,
      });
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> getTpnStep({required RegimenModel regimenModel}) async {
    try {
      final DocumentReference reference = firestore
          .collection('regimens')
          .doc(timestampToDateTime(regimenModel.beginTime!).toString())
          .collection('treatment')
          .doc('treatment');

      final DocumentSnapshot documentSnapshot = await reference.get();

      return documentSnapshot.get('step');
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> createTpnTreatment({required RegimenModel regimenModel}) async {
    try {
      final DocumentReference reference = firestore
          .collection('regimens')
          .doc(timestampToDateTime(regimenModel.beginTime!).toString())
          .collection('treatment')
          .doc('treatment');

      const TpnModel tpnModel = TpnModel(
        description: '',
        medicalActions: [],
        tpnType: '',
        step: 'step1',
        passingCount: 0,
        unPassingCount: 0,
      );

      await reference.set(tpnModel.toJson());
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<num> getPassingCount({required RegimenModel regimenModel}) async {
    try {
      final DocumentReference reference = firestore
          .collection('regimens')
          .doc(timestampToDateTime(regimenModel.beginTime!).toString())
          .collection('treatment')
          .doc('treatment');
      final DocumentSnapshot documentSnapshot = await reference.get();
      final num passingCount = documentSnapshot['passingCount'];
      return passingCount;
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<num> getUnpassingCount({required RegimenModel regimenModel}) async {
    try {
      final DocumentReference reference = firestore
          .collection('regimens')
          .doc(timestampToDateTime(regimenModel.beginTime!).toString())
          .collection('treatment')
          .doc('treatment');
      final DocumentSnapshot documentSnapshot = await reference.get();
      final num unpassingCount = documentSnapshot['unPassingCount'];
      return unpassingCount;
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updatePassingCount({required RegimenModel regimenModel}) async {
    try {
      final DocumentReference reference = firestore
          .collection('regimens')
          .doc(timestampToDateTime(regimenModel.beginTime!).toString())
          .collection('treatment')
          .doc('treatment');
      // Lấy dữ liệu hiện tại của 'medicalActions.0'
      DocumentSnapshot snapshot = await reference.get();
      num currentPassingCount = snapshot['passingCount'];
      // Cập nhật giá trị mới của 'passingCount' và giữ nguyên các trường khác
      await reference.update({'passingCount': currentPassingCount + 1});
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateUnpassingCount(
      {required RegimenModel regimenModel}) async {
    try {
      final DocumentReference reference = firestore
          .collection('regimens')
          .doc(timestampToDateTime(regimenModel.beginTime!).toString())
          .collection('treatment')
          .doc('treatment');
      DocumentSnapshot snapshot = await reference.get();
      num current = snapshot['unPassingCount'];
      await reference.update({'unPassingCount': current + 1});
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<dynamic>> getTpnHistory({
    required RegimenModel regimenModel,
  }) async {
    try {
      final reference = firestore
          .collection('regimens')
          .doc(timestampToDateTime(regimenModel.beginTime!).toString())
          .collection('treatment')
          .doc('treatment');

      final DocumentSnapshot documentSnapshot = await reference.get();
      return documentSnapshot['medicalActions'];
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
