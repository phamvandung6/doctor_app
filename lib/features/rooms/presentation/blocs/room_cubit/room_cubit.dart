import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/rooms/domain/entities/room_entity.dart';
import 'package:doctor_app/features/rooms/domain/usecases/create_room_use_case.dart';
import 'package:doctor_app/features/rooms/domain/usecases/delete_room_use_case.dart';
import 'package:doctor_app/features/rooms/domain/usecases/get_rooms_use_case.dart';
import 'package:equatable/equatable.dart';

part 'room_state.dart';

class RoomCubit extends Cubit<RoomState> {
  RoomCubit({
    required this.getRoomsUseCase,
    required this.deleteRoomUseCase,
    required this.createRoomUseCase,
  }) : super(RoomInitial());

  final GetRoomsUseCase getRoomsUseCase;
  final DeleteRoomUseCase deleteRoomUseCase;
  final CreateRoomUseCase createRoomUseCase;

  Future<void> fetchRooms() async {
    emit(RoomLoading());
    try {
      final rooms = getRoomsUseCase.call();
      emit(RoomLoaded(rooms));
    } catch (e) {
      emit(RoomLoadError(e.toString()));
    }
  }

  Future<void> deleteRoom({required String id}) async {
    emit(RoomLoading());
    try {
      deleteRoomUseCase.call(params: DeleteRoomParams(roomId: id));
      final rooms = getRoomsUseCase.call();
      emit(RoomLoaded(rooms));
    } catch (e) {
      emit(RoomLoadError(e.toString()));
    }
  }

  Future<void> createRoom({required RoomEntity room}) async {
    emit(RoomLoading());
    try {
      await createRoomUseCase.call(params: CreateRoomParams(roomEntity: room));
      final rooms = getRoomsUseCase.call();
      emit(RoomLoaded(rooms));
    } catch (e) {
      emit(RoomLoadError(e.toString()));
    }
  }

}
