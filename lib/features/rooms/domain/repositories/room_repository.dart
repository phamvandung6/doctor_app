import 'package:doctor_app/features/rooms/domain/entities/room_entity.dart';

abstract class RoomRepository {
  Stream<List<RoomEntity>> getRooms();

  Future<void> createRoom({
    required RoomEntity roomEntity,
  });

  Future<void> deleteRoom({
    required String roomId,
  });
}
