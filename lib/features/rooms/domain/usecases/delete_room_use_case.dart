import 'package:doctor_app/features/rooms/domain/repositories/room_repository.dart';
import 'package:equatable/equatable.dart';

class DeleteRoomUseCase {
  final RoomRepository roomRepository;

  DeleteRoomUseCase({
    required this.roomRepository,
  });

  Future<void> call({
    required DeleteRoomParams params,
  }) async {
    try {
      await roomRepository.deleteRoom(
        roomId: params.roomId,
      );
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}

class DeleteRoomParams extends Equatable {
  final String roomId;

  const DeleteRoomParams({
    required this.roomId,
  });

  @override
  List<Object?> get props => [roomId];
}
