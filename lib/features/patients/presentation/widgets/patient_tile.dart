import 'package:doctor_app/features/patients/domain/entities/patient_entity.dart';
import 'package:doctor_app/features/patients/presentation/blocs/patient_cubit/patient_cubit.dart';
import 'package:doctor_app/features/patients/presentation/blocs/pick_patient_cubit/pick_patient_cubit.dart';
import 'package:doctor_app/features/patients/presentation/screens/patient_home_page.dart';
import 'package:doctor_app/features/regimen/presentation/screens/regimens_screen.dart';
import 'package:doctor_app/features/rooms/presentation/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientTile extends StatelessWidget {
  const PatientTile({super.key, required this.patient});
  final PatientEntity patient;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<PickPatientCubit>().pickPatient(patient: patient);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BlocProvider.value(
            value: context.read<PickPatientCubit>(),
            child: const PatientHomePage(),
          );
        }));
      },
      tileColor: const Color(0xffFAF6F0),
      leading: CircleAvatar(
        backgroundColor: const Color(0xff9EB8D9),
        child: Text(patient.id!),
      ),
      title: Text('Tên bệnh nhân: ${patient.name}'),
      subtitle: Text('Id: ${patient.id}'),
      trailing: PopupMenu(
        deleteCallBack: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Xác nhận xóa'),
                content: const Text(
                  'Bạn có chắc chắn muốn xóa bệnh nhân này không?',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      context
                          .read<PatientCubit>()
                          .deletePatient(patient: patient);
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
    );
  }
}
