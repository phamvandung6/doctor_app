import 'package:doctor_app/core/utils/constants/colors.dart';
import 'package:doctor_app/core/utils/functions/convert_time.dart';
import 'package:doctor_app/features/patients/presentation/blocs/pick_patient_cubit/pick_patient_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final patient = context.read<PickPatientCubit>().state.patient;

    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thông tin bệnh nhân',
            style: TextStyle(color: TColors.dark, fontSize: 20),
          ),
          const SizedBox(height: 20),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20.0),
            child: Table(
              children: [
                TableRow(children: [
                  const Text('ID:'),
                  Text(patient.id!),
                ]),
                TableRow(children: [
                  const Text('Họ và tên:'),
                  Text(patient.name!),
                ]),
                TableRow(children: [
                  const Text('Giới tính:'),
                  Text(patient.gender!),
                ]),
                TableRow(children: [
                  const Text('Ngày sinh: '),
                  Text(formatTimestampToDateTime(
                      stringToTimestamp(patient.birthday!))),
                ]),
                TableRow(children: [
                  const Text('Địa chỉ:'),
                  Text(patient.address!),
                ]),
                TableRow(children: [
                  const Text('Số điện thoại:'),
                  Text(patient.phone!),
                ]),
                TableRow(children: [
                  const Text('Chiều cao'),
                  Text(patient.height!),
                ]),
                TableRow(children: [
                  const Text('Cân nặng'),
                  Text(patient.weight!),
                ]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
