import 'package:doctor_app/core/utils/functions/convert_time.dart';
import 'package:doctor_app/features/patients/presentation/blocs/pick_patient_cubit/pick_patient_cubit.dart';
import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/regimen/presentation/blocs/regimen_cubit/regimen_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/tpn_cubit/tpn_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CreateRegimenScreen extends StatelessWidget {
  const CreateRegimenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final List<String> regimenOptions = ['TPN', 'Mouth', '...'];

    final patient = context.read<PickPatientCubit>().state.patient;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo phác đồ'),
      ),
      body: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              FormBuilderDropdown<String>(
                name: 'regimen',
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Phác đồ',
                  suffix: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      formKey.currentState!.fields['regimen']?.reset();
                    },
                  ),
                  hintText: 'Chọn phác đồ',
                ),
                items: regimenOptions
                    .map((gender) => DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  formKey.currentState!.save();
                  final String name = formKey.currentState!.value['regimen'];
                  final regimen = RegimenEntity(
                    patientId: patient.id!,
                    beginTime: dateTimeToTimestamp(DateTime.now()),
                    name: name,
                    description: name == 'TPN' ? 'Phác đồ  TPN' : 'null nhé',
                  );
                  context.read<RegimenCubit>().createRegimen(regimen: regimen);
                  context.read<TpnCubit>().createTpnModel(regimen: regimen);
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
