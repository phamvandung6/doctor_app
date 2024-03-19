import 'package:doctor_app/features/rooms/domain/entities/room_entity.dart';
import 'package:doctor_app/features/rooms/domain/repositories/room_repository.dart';
import 'package:equatable/equatable.dart';

class CreateRoomUseCase {
  final RoomRepository roomRepository;

  const CreateRoomUseCase({
    required this.roomRepository,
  });

  Future<void> call({required CreateRoomParams params}) async {
    try {
      return await roomRepository.createRoom(roomEntity: params.roomEntity);
    } on ArgumentError catch (error) {
      throw Exception(error);
    } catch (error) {
      throw Exception(error);
    }
  }
}

class CreateRoomParams extends Equatable {
  final RoomEntity roomEntity;

  const CreateRoomParams({required this.roomEntity});

  @override
  List<Object?> get props => [roomEntity];
}
