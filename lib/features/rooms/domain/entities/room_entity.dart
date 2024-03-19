import 'package:equatable/equatable.dart';

class RoomEntity extends Equatable {
  final String? roomName;
  final String? roomId;

  const RoomEntity({this.roomName, this.roomId});

  @override
  List<Object?> get props => [roomName, roomId];
}
