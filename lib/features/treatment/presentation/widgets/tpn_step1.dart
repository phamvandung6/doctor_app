import 'package:doctor_app/features/regimen/presentation/blocs/pick_regimen_cubit/pick_regimen_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/tpn_cubit/tpn_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TpnStep1 extends StatelessWidget {
  const TpnStep1({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return Column(
      children: [
        FormBuilder(
          key: formKey,
          child: FormBuilderRadioGroup(
            name: 'yesOrNoInsulin',
            options: const [
              FormBuilderFieldOption(
                value: 'Có',
              ),
              FormBuilderFieldOption(
                value: 'Không',
              )
            ],
            decoration: const InputDecoration(
              labelText: 'Bệnh nhân có tiền sử tiêm Insulin không?',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            formKey.currentState!.save();
            final regimen = context.read<PickRegimenCubit>().state.regimen;
            final yesOrNoInsulin =
                formKey.currentState?.value['yesOrNoInsulin'];

            if (yesOrNoInsulin == 'Có') {
              context.read<TpnCubit>().submitStep1(
                    description:
                        'Phác đồ dành cho bệnh nhân ĐTD có tiền sử tiêm Insulin',
                    regimen: regimen,
                    tpnType: 'Yes Insulin',
                    tpnStep: 'step2',
                  );
            } else if (yesOrNoInsulin == 'Không') {
              context.read<TpnCubit>().submitStep1(
                  description:
                      "Phác đồ dành cho bệnh nhân ĐTD không có tiền sử tiêm insulin",
                  regimen: regimen,
                  tpnType: 'No Insulin',
                  tpnStep: 'step2');
            }
          },
          child: const Text('Tiếp tục'),
        )
      ],
    );
  }
}
