import 'package:doctor_app/features/regimen/presentation/blocs/pick_regimen_cubit/pick_regimen_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/check_time_cubit/check_time_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/tpn_cubit/tpn_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/widgets/tpn_step1.dart';
import 'package:doctor_app/features/treatment/presentation/widgets/tpn_step2_no_insulin.dart';
import 'package:doctor_app/features/treatment/presentation/widgets/tpn_step2_yes_insulin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TpnTreatmentScreen extends StatelessWidget {
  const TpnTreatmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final regimen = context.read<PickRegimenCubit>().state.regimen;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Điều trị tpn'),
      // ),
      body: Column(
        children: [
          const Center(
            child: Text(
                'Phác đồ cho bệnh nhân ĐTD nuôi dưỡng bằng đường tĩnh mạch'),
          ),
          const SizedBox(height: 30),
          BlocBuilder<CheckTimeCubit, CheckTimeState>(
            builder: (context, state) {
              if (state is CheckTimeSuccess) {
                context.read<TpnCubit>().getTpnStep(regimenEntity: regimen);
                return BlocConsumer<TpnCubit, TpnState>(
                  listener: (context, tpnState) {
                    if (tpnState is TpnError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(tpnState.message)));
                    }
                  },
                  builder: (context, tpnState) {
                    if (tpnState is TpnStep1State) {
                      return const TpnStep1();
                    } else if (tpnState is TpnStep2State) {
                      if (tpnState.typeInsulin == 'Yes Insulin') {
                        return const TpnStep2YesInsulin();
                      } else if (tpnState.typeInsulin == 'No Insulin') {
                        return const TpnStep2NoInsulin();
                      }
                    } else if (tpnState is TpnStep3State) {
                      return const Center(
                        child: Text("Bệnh nhân đã hoàn thành phác đồ điều trị"),
                      );
                    }
                    return const Center(
                      child: Text('Đã có lỗi'),
                    );
                  },
                );
              } else if (state is CheckTimeFailed) {
                context.read<TpnCubit>().getTpnStep(regimenEntity: regimen);
                return BlocBuilder<TpnCubit, TpnState>(
                    builder: (context, tpnState) {
                  if (tpnState is TpnStep3State) {
                    return const Center(
                      child:
                          Text("Bệnh nhân này đã hoàn thành phác đồ điều trị"),
                    );
                  }
                  return Center(
                    child: Text(state.message),
                  );
                });
              } else {
                return const Center(
                  child: Text("Đã có lỗi xuất hiện"),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
