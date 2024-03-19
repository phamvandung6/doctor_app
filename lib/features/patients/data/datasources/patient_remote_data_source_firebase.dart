import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/features/patients/data/datasources/patient_remote_data_source.dart';
import 'package:doctor_app/features/patients/data/models/patient_model.dart';

class PatientRemoteDataSourceFirebase implements PatientRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  PatientRemoteDataSourceFirebase({required this.firebaseFirestore});

  @override
  Future<void> createPatient({required PatientModel patient}) async {
    try {
      firebaseFirestore
          .collection('patients')
          .doc(patient.id)
          .set(patient.toJson());
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> deletePatient({required String id}) async {
    try {
      await firebaseFirestore.collection('patients').doc(id).delete();
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<PatientModel>> getPatientById({required String id}) async {
    try {
      return firebaseFirestore
          .collection('patients')
          .doc(id)
          .get()
          .then((value) => [PatientModel.fromJson(value.data()!)]);
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Stream<List<PatientModel>> getPatients({required String roomId}) {
    try {
      return firebaseFirestore
          .collection('patients')
          .where('room', isEqualTo: roomId)
          .snapshots()
          .map((event) =>
              event.docs.map((e) => PatientModel.fromJson(e.data())).toList());
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> updatePatient({required PatientModel patient}) async {
    try {
      firebaseFirestore
          .collection('patients')
          .doc(patient.id)
          .update(patient.toJson());
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}
