import 'package:doctor_app/features/rooms/data/datasource/room_remote_data_source.dart';
import 'package:doctor_app/features/rooms/data/models/room_model.dart';
import 'package:doctor_app/features/rooms/domain/entities/room_entity.dart';
import 'package:doctor_app/features/rooms/domain/repositories/room_repository.dart';

class RoomRepositoryImpl implements RoomRepository {
  final RoomRemoteDataSource remoteDataSource;

  RoomRepositoryImpl({required this.remoteDataSource});
  
  @override
  Future<void> deleteRoom({required String roomId}) async =>
      await remoteDataSource.deleteRoom(roomId: roomId);

  @override
  Stream<List<RoomEntity>> getRooms() {
    return remoteDataSource.getRooms();
  }
  
  @override
  Future<void> createRoom({required RoomEntity roomEntity}) {
    return remoteDataSource.createRoom(room: RoomModel.fromEntity(roomEntity));
  }
}
