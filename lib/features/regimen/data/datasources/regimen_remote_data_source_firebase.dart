import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/core/utils/functions/convert_time.dart';
import 'package:doctor_app/features/regimen/data/datasources/regimen_remote_data_source.dart';
import 'package:doctor_app/features/regimen/data/models/regimen_model.dart';

class RegimenRemoteDataSourceFirebase implements RegimenRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  RegimenRemoteDataSourceFirebase({required this.firebaseFirestore});

  @override
  Future<void> createRegimen({required RegimenModel regimen}) async {
    try {
      await firebaseFirestore
          .collection('regimens')
          .doc(timestampToDateTime(regimen.beginTime!).toString())
          .set(regimen.toJson());
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> deleteRegimen({required RegimenModel regimen}) async {
    try {
      await firebaseFirestore
          .collection('regimens')
          .doc(timestampToDateTime(regimen.beginTime!).toString())
          .delete();
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Stream<List<RegimenModel>> getRegimens({required String patientId}) {
    try {
      return firebaseFirestore
          .collection('regimens')
          .where('patientId', isEqualTo: patientId)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => RegimenModel.fromJson(doc.data()))
              .toList());
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
