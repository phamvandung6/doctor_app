import 'package:doctor_app/core/utils/constants/colors.dart';
import 'package:doctor_app/features/rooms/data/models/room_model.dart';
import 'package:doctor_app/features/rooms/presentation/blocs/room_cubit/room_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CreateRoomScreen extends StatelessWidget {
  const CreateRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo phòng bệnh'),
      ),
      body: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'roomName',
                decoration: InputDecoration(
                  labelText: 'Tên phòng',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: TColors.blue.withOpacity(0.1),
                ),
              ),
              FormBuilderTextField(
                name: 'roomId',
                decoration: InputDecoration(
                  labelText: 'ID phòng',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: TColors.blue.withOpacity(0.1),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  formKey.currentState!.save();
                  final room = RoomModel(
                    roomId:
                        formKey.currentState!.value['roomId'].toString().trim(),
                    roomName: formKey.currentState!.value['roomName']
                        .toString()
                        .trim(),
                  );
                  context.read<RoomCubit>().createRoom(room: room);
                  Navigator.pop(context);
                },
                child: const Text('Tạo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
