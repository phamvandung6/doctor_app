import 'package:doctor_app/features/rooms/data/models/room_model.dart';

abstract class RoomRemoteDataSource {
  Stream<List<RoomModel>> getRooms();

  Future<void> createRoom({
    required RoomModel room,
  });

  Future<void> deleteRoom({
    required String roomId,
  });
}
