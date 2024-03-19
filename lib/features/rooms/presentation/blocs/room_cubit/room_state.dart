part of 'room_cubit.dart';

sealed class RoomState extends Equatable {
  const RoomState();

  @override
  List<Object> get props => [];
}

final class RoomInitial extends RoomState {}

final class RoomLoading extends RoomState {}

final class RoomLoaded extends RoomState {
  final Stream<List<RoomEntity>> rooms;
  const RoomLoaded(this.rooms);

  @override
  List<Object> get props => [rooms];
}

final class RoomLoadError extends RoomState {
  final String message;
  const RoomLoadError(this.message);

  @override
  List<Object> get props => [message];
}

final class RoomPicked extends RoomState {
  final RoomEntity room;
  const RoomPicked(this.room);

  @override
  List<Object> get props => [room];
}