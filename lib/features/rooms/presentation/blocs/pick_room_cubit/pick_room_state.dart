part of 'pick_room_cubit.dart';

final class PickRoomState extends Equatable {
  final RoomEntity room;

  const PickRoomState(this.room);

  @override
  List<Object> get props => [room];
}


