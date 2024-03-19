import 'package:bloc/bloc.dart';
import 'package:doctor_app/features/rooms/domain/entities/room_entity.dart';
import 'package:equatable/equatable.dart';

part 'pick_room_state.dart';

class PickRoomCubit extends Cubit<PickRoomState> {
  PickRoomCubit()
      : super(const PickRoomState(RoomEntity(roomId: '', roomName: '')));

  void pickRoom({required RoomEntity room}) {
    try {
      emit(PickRoomState(room));
    } catch (e) {
      print(e);
    }
  }
}
