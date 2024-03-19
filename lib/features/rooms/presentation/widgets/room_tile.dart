import 'package:doctor_app/core/utils/constants/colors.dart';
import 'package:doctor_app/features/patients/presentation/screens/patient_screen.dart';
import 'package:doctor_app/features/rooms/domain/entities/room_entity.dart';
import 'package:doctor_app/features/rooms/presentation/blocs/pick_room_cubit/pick_room_cubit.dart';
import 'package:doctor_app/features/rooms/presentation/blocs/room_cubit/room_cubit.dart';
import 'package:doctor_app/features/rooms/presentation/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomTile extends StatelessWidget {
  const RoomTile({
    super.key,
    required this.room,
  });

  final RoomEntity room;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            context.read<PickRoomCubit>().pickRoom(room: room);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                    value: context.read<PickRoomCubit>(),
                    child: const PatientScreen()),
              ),
            );
          },
          tileColor: TColors.primary.withOpacity(0.1),
          leading: CircleAvatar(
            backgroundColor: TColors.primary,
            child: Text(room.roomName ?? ''),
          ),
          title: Text(
            'Tên phòng: ${room.roomName}',
            style: const TextStyle(fontSize: 16),
          ),
          subtitle: Text('Id phòng: ${room.roomId}'),
          trailing: PopupMenu(
            deleteCallBack: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Xác nhận xóa'),
                    content: Text(
                      'Bạn có chắc chắn muốn xóa ${room.roomName} không?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          context
                              .read<RoomCubit>()
                              .deleteRoom(id: room.roomId!);
                          Navigator.pop(context);
                        },
                        child: const Text('Xóa'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Hủy'),
                      )
                    ],
                  );
                },
              );
            },
          ),
        ),
        const Divider(
          color: TColors.darkBlue,
          thickness: 0.3,
          height: 0.3,
        ),
      ],
    );
  }
}

// class CustomSearchRoomDelegate extends SearchDelegate {
//   Stream<List<Room>> searchTerms = RoomRepository(dbClient: dbClient).streamFetchRooms();
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//           },
//           icon: const Icon(Icons.clear))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: const Icon(Icons.arrow_back),
//     );
//   }

//   // @override
//   // Widget buildResults(BuildContext context) {
//   //   Stream<List<Room>> matchQuery = RoomRepository(dbClient: dbClient).getRoomById(query);
//   //   return StreamBuilder<List<Room>>(
//   //     stream: matchQuery,
//   //     builder: (context, snapshot) {
//   //       if (snapshot.hasData) {
//   //         final rooms = snapshot.data!;
//   //         return ListView.builder(
//   //           physics: const BouncingScrollPhysics(),
//   //           itemCount: rooms.length,
//   //           itemBuilder: (context, index) {
//   //             final room = rooms[index];
//   //             return _roomTile(context, room);
//   //           },
//   //         );
//   //       } else if (snapshot.hasError) {
//   //         return const Center(child: Text('Đã có lỗi xảy ra'));
//   //       } else {
//   //         return const Center(child: CircularProgressIndicator());
//   //       }
//   //     },
//   //   );
//   // }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     Stream<List<Room>> matchQuery = RoomProvider.getRooms();
//     return StreamBuilder<List<Room>>(
//       stream: matchQuery,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final rooms = snapshot.data!;
//           return ListView.builder(
//             physics: const BouncingScrollPhysics(),
//             itemCount: rooms.length,
//             itemBuilder: (context, index) {
//               final room = rooms[index];
//               return _roomTile(context, room);
//             },
//           );
//         } else if (snapshot.hasError) {
//           return const Center(child: Text('Đã có lỗi xảy ra'));
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }

//   Padding _roomTile(BuildContext context, Room room) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       child: ListTile(
//         onTap: () {
//           // debugPrint('Chuyển sang màn hình danh sách bệnh nhân');
//         },
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadiusDirectional.circular(23),
//         ),
//         tileColor: Colors.white,
//         leading: CircleAvatar(
//           backgroundColor: const Color(0xffA6E3E9),
//           child: Text(room.roomName),
//         ),
//         title: Text(
//           'Tên phòng: ${room.roomName}',
//           style: const TextStyle(fontSize: 16),
//         ),
//         subtitle: Text('Id phòng: ${room.roomId}'),
//       ),
//     );
//   }
// }