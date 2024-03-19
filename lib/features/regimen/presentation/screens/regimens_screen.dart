import 'package:doctor_app/features/patients/presentation/blocs/pick_patient_cubit/pick_patient_cubit.dart';
import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/regimen/presentation/blocs/regimen_cubit/regimen_cubit.dart';
import 'package:doctor_app/features/regimen/presentation/screens/create_regimen_screen.dart';
import 'package:doctor_app/features/regimen/presentation/widgets/regimen_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegimenScreen extends StatelessWidget {
  const RegimenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final patient = context.read<PickPatientCubit>().state.patient;
    context.read<RegimenCubit>().fetchRegimens(patientId: patient.id!);
    return BlocBuilder<RegimenCubit, RegimenState>(
      builder: (context, state) {
        if (state is RegimenLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RegimenLoaded) {
          return StreamBuilder(
            stream: state.regimens,
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
                      body: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tổng số phác đồ: ${patients!.length}',
                                  style: const TextStyle(fontSize: 17),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return BlocProvider.value(
                                          value:
                                              context.read<PickPatientCubit>(),
                                          child: const CreateRegimenScreen(),
                                        );
                                      }));
                                    },
                                    icon: const Icon(Icons.add)),
                              ],
                            ),
                          ),
                          _listRegimens(patients),
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

  Expanded _listRegimens(List<RegimenEntity> regimens) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: regimens.length,
        itemBuilder: (context, index) {
          final regimen = regimens[index];
          return Padding(
            padding: const EdgeInsets.all(8),
            child: RegimenTile(regimen: regimen),
          );
        },
      ),
    );
  }
}
