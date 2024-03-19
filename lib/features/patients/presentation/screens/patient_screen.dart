import 'package:doctor_app/features/patients/domain/entities/patient_entity.dart';
import 'package:doctor_app/features/patients/presentation/blocs/patient_cubit/patient_cubit.dart';
import 'package:doctor_app/features/patients/presentation/screens/create_patient_screen.dart';
import 'package:doctor_app/features/patients/presentation/widgets/patient_tile.dart';
import 'package:doctor_app/features/rooms/presentation/blocs/pick_room_cubit/pick_room_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final room = context.read<PickRoomCubit>().state.room;
    context.read<PatientCubit>().fetchPatients(roomId: room.roomId!);
    return BlocBuilder<PatientCubit, PatientState>(
      builder: (context, state) {
        if (state is PatientLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PatientLoaded) {
          return StreamBuilder(
            stream: state.patients,
            builder: (context, snapshot) {
              final patients = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    return const Center(child: Text('Đã có lỗi xảy ra'));
                  } else {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Danh sách bệnh nhân'),
                        actions: [
                          _createPatient(context),
                          // _searchRoom(context),
                        ],
                      ),
                      body: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child:
                                Text('Tổng số bệnh nhân: ${patients!.length}'),
                          ),
                          _listPatients(patients),
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

  Expanded _listPatients(List<PatientEntity> patients) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: patients.length,
        itemBuilder: (context, index) {
          final patient = patients[index];
          return Padding(
            padding: const EdgeInsets.all(8),
            child: PatientTile(patient: patient),
          );
        },
      ),
    );
  }

  IconButton _createPatient(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreatePatientScreen()));
        },
        icon: const Icon(Icons.add));
  }
}
