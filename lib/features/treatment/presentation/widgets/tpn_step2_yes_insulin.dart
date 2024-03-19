import 'package:doctor_app/core/utils/functions/convert_time.dart';
import 'package:doctor_app/features/regimen/presentation/blocs/pick_regimen_cubit/pick_regimen_cubit.dart';
import 'package:doctor_app/features/treatment/domain/object/medical_check_glucose.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/check_glucose_on_time_cubit/check_glucose_on_time_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/glucose_cubit/glucose_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/tpn_cubit/tpn_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TpnStep2YesInsulin extends StatelessWidget {
  const TpnStep2YesInsulin({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final regimen = context.read<PickRegimenCubit>().state.regimen;
    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          BlocBuilder<GlucoseCubit, GlucoseState>(
            builder: (context, state) {
              if (state is GlucoseInitial) {
                return BlocBuilder<CheckGlucoseOnTimeCubit,
                    CheckGlucoseOnTimeState>(
                  builder: (context, onTimeState) {
                    context
                        .read<CheckGlucoseOnTimeCubit>()
                        .isCheckGlucoseOnTime(regimen: regimen);
                    if (onTimeState is GlucoseWaitingTime) {
                      return const Center(
                        child: Text(
                            'Bạn đã kiểm tra bệnh nhân này rồi, hãy đợi đến khung giờ tiếp theo để kiểm tra tiếp'),
                      );
                    }
                    return Column(
                      children: [
                        const Text(
                          'Truyền glucose 10% 500ml pha truyền 5UI Actrapid hoặc Nutriflex pha truyền 9UI Actrapid',
                        ),
                        FormBuilderTextField(
                          name: 'glucose',
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Glucose UI',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final tpnCubit = context.read<TpnCubit>();

                            formKey.currentState!.save();
                            final num glucose = num.parse(
                                formKey.currentState?.value['glucose']);

                            context
                                .read<GlucoseCubit>()
                                .checkGlucose(glucose: glucose);
                            final checkGlu = MedicalCheckGlucose(
                              glucoseUI: glucose,
                              time: dateTimeToTimestamp(DateTime.now()),
                            );
                            context.read<TpnCubit>().addMedicalCheckGlucose(
                                  medicalCheckGlucose: checkGlu,
                                  regimenEntity: regimen,
                                );
                            if (glucose >= 3.9 && glucose <= 8.3) {
                              tpnCubit.updatePassingCount(
                                  regimenEntity: regimen);
                            } else {
                              tpnCubit.updateUnpassingCount(
                                  regimenEntity: regimen);
                            }
                            var passingCount = await tpnCubit.getPassingCount(
                                regimenEntity: regimen);

                            if (passingCount >= 7) {
                              tpnCubit.doneRegimen();
                              tpnCubit.updateTpnStep(
                                  tpnStep: 'step3', regimenEntity: regimen);
                            }
                          },
                          child: const Text('Đã truyền glucose và tiếp tục'),
                        ),
                      ],
                    );
                  },
                );
              } else if (state is GlucoseLow) {
                return const Text(
                    'Đạt mục tiêu, Chờ đến khung giờ tiếp theo để đo tiếp');
              } else if (state is GlucoseMedium) {
                return const Text('Tiem duoi da nova atrapid 2UI');
              } else if (state is GlucoseHigh) {
                return const Text('Tiem duoi da nova atrapid 4UI');
              } else if (state is GlucoseWaitingTime) {
                return const Center(
                  child: Text(
                      'Bạn đã kiểm tra bệnh nhân này rồi, hãy đợi khung giờ tiếp theo để kiểm tra tiếp'),
                );
              } else {
                return const Text('Lỗi');
              }
            },
          ),
        ],
      ),
    );
  }
}
