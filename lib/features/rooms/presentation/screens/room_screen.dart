import 'package:doctor_app/features/rooms/domain/entities/room_entity.dart';
import 'package:doctor_app/features/rooms/presentation/blocs/room_cubit/room_cubit.dart';
import 'package:doctor_app/features/rooms/presentation/screens/create_room_screen.dart';
import 'package:doctor_app/features/rooms/presentation/widgets/room_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomCubit, RoomState>(
      builder: (context, state) {
        if (state is RoomLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RoomLoaded) {
          return StreamBuilder(
            stream: state.rooms,
            builder: (context, snapshot) {
              final rooms = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return const Center(child: Text('Đã có lỗi xảy ra'));
                  } else {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Danh sách phòng bệnh'),
                        actions: [
                          _createRoom(context),
                          // _searchRoom(context),
                        ],
                      ),
                      body: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text('Tổng số phòng bệnh: ${rooms!.length}'),
                          ),
                          _listRoom(rooms),
                        ],
                      ),
                    );
                  }
              }
            },
          );
        } else {
          return const Center(child: Text('Đã có lỗi xảy ra'));
        }
      },
    );
  }

  Expanded _listRoom(List<RoomEntity> rooms) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          final room = rooms[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: RoomTile(room: room),
          );
        },
      ),
    );
  }

  IconButton _createRoom(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateRoomScreen()),
          );
        },
        icon: const Icon(Icons.add));
  }
}
