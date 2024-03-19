import 'package:doctor_app/features/rooms/domain/entities/room_entity.dart';
import 'package:doctor_app/features/rooms/domain/repositories/room_repository.dart';

class GetRoomsUseCase {
  final RoomRepository roomRepository;

  GetRoomsUseCase({
    required this.roomRepository,
  });

  Stream<List<RoomEntity>> call() {
    try {
      return roomRepository.getRooms();
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}