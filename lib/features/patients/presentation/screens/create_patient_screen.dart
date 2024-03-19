import 'package:doctor_app/features/patients/domain/entities/patient_entity.dart';
import 'package:doctor_app/features/patients/presentation/blocs/patient_cubit/patient_cubit.dart';
import 'package:doctor_app/features/rooms/presentation/blocs/pick_room_cubit/pick_room_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CreatePatientScreen extends StatelessWidget {
  const CreatePatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final room = context.read<PickRoomCubit>().state.room;

    List<String> genderOptions = ['Nam', 'Nữ', 'Khác'];

    return Scaffold(
        appBar: AppBar(
          title: const Text("Create patient screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: FormBuilder(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'id',
                    decoration: const InputDecoration(
                      labelText: 'Id',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  FormBuilderTextField(
                    name: 'name',
                    decoration: const InputDecoration(
                      labelText: 'Họ tên',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  FormBuilderDropdown<String>(
                    name: 'gender',
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Giới tính',
                      suffix: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          formKey.currentState!.fields['gender']?.reset();
                        },
                      ),
                      hintText: 'Giới tính',
                    ),
                    items: genderOptions
                        .map((gender) => DropdownMenuItem(
                              alignment: AlignmentDirectional.centerStart,
                              value: gender,
                              child: Text(gender),
                            ))
                        .toList(),
                  ),
                  FormBuilderTextField(
                    name: 'phone',
                    decoration: const InputDecoration(
                      labelText: 'Số điện thoại',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  FormBuilderTextField(
                    name: 'height',
                    decoration: const InputDecoration(
                      labelText: 'Chiều cao',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  FormBuilderTextField(
                    name: 'weight',
                    decoration: const InputDecoration(
                      labelText: 'Cân nặng',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  FormBuilderTextField(
                    name: 'address',
                    decoration: const InputDecoration(
                      labelText: 'Địa chỉ',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  FormBuilderDateTimePicker(
                    inputType: InputType.date,
                    name: 'birthday',
                    decoration: const InputDecoration(
                      labelText: 'Ngày sinh',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.date_range),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        formKey.currentState?.save();
                        final patient = PatientEntity(
                          address: formKey.currentState?.value['address'],
                          birthday: formKey.currentState?.value['birthday']
                              .toString(),
                          name: formKey.currentState?.value['name'],
                          gender: formKey.currentState?.value['gender'],
                          room: room.roomId,
                          id: formKey.currentState?.value['id'],
                          height: formKey.currentState?.value['height'],
                          weight: formKey.currentState?.value['weight'],
                          phone: formKey.currentState?.value['phone'],
                        );
                        context
                            .read<PatientCubit>()
                            .createPatient(patient: patient);
                        Navigator.pop(context);
                      },
                      child: const Text("OK"))
                ],
              ),
            ),
          ),
        ));
  }
}
