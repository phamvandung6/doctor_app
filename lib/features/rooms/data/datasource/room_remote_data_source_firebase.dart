import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/features/rooms/data/datasource/room_remote_data_source.dart';
import 'package:doctor_app/features/rooms/data/models/room_model.dart';

class RoomRemoteDataSourceFirebase implements RoomRemoteDataSource {
  RoomRemoteDataSourceFirebase({
    required this.firebaseFirestore,
  });

  final FirebaseFirestore firebaseFirestore;

  @override
  Future<void> deleteRoom({required String roomId}) async {
    //delete room from firestore
    try {
      await firebaseFirestore.collection('rooms').doc(roomId).delete();
    } on FirebaseException catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Stream<List<RoomModel>> getRooms() {
    //stream get rooms from firestore
    try {
      final snapshots = firebaseFirestore.collection('rooms').snapshots();
      return snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => RoomModel.fromJson(doc.data()))
            .toList();
      });
    } on FirebaseException catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> createRoom({required RoomModel room}) async {
    try {
      await firebaseFirestore.collection('rooms').doc(room.roomId).set(room.toJson());
    } on FirebaseException catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}
