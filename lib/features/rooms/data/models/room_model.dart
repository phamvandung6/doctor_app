import 'package:doctor_app/features/rooms/domain/entities/room_entity.dart';

class RoomModel extends RoomEntity {
  const RoomModel({
    super.roomId,
    super.roomName,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      roomId: json['roomId'],
      roomName: json['roomName'],
    );
  }

  //convert entity to model
  factory RoomModel.fromEntity(RoomEntity roomEntity) {
    return RoomModel(
      roomId: roomEntity.roomId,
      roomName: roomEntity.roomName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'roomName': roomName,
    };
  }

  RoomModel copyWith({
    String? roomId,
    String? roomName,
  }) {
    return RoomModel(
      roomId: roomId ?? this.roomId,
      roomName: roomName ?? this.roomName,
    );
  }

  @override
  String toString() {
    return 'RoomModel(roomId: $roomId, roomName: $roomName)';
  }

  @override
  List<Object?> get props => [roomId, roomName];
}
