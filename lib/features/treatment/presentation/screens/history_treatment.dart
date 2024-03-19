import 'package:doctor_app/core/utils/constants/colors.dart';
import 'package:doctor_app/core/utils/functions/convert_time.dart';
import 'package:doctor_app/features/regimen/presentation/blocs/pick_regimen_cubit/pick_regimen_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/get_history_cubit/get_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

class HistoryTreatment extends StatelessWidget {
  const HistoryTreatment({super.key});

  @override
  Widget build(BuildContext context) {
    final regimen = context.read<PickRegimenCubit>().state.regimen;
    context.read<GetHistoryCubit>().getTpnHistory(regimenEntity: regimen);
    return BlocBuilder<GetHistoryCubit, GetHistoryState>(
        builder: (context, state) {
      if (state is GetTpnHistorySuccess) {
        final elements = state.medicalActions;
        return Scaffold(
          body: StickyGroupedListView<dynamic, String>(
            elements: elements,
            groupBy: (element) => timestampToDateTime(element['time'])
                .toString()
                .substring(0, 10),
            groupSeparatorBuilder: (value) {
              final timeStr = timestampToDateTime(value['time'])
                  .toString()
                  .substring(0, 10);
              // Format DateTime String to "dd-MM-yyyy"
              final formatter = DateFormat('dd-MM-yyyy');
              final formatted = formatter.format(DateTime.parse(timeStr));

              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: TColors.blue,
                child: Text(
                  formatted,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              );
            },
            itemBuilder: (context, element) {
              final timeStr = timestampToDateTime(element['time'])
                  .toString()
                  .substring(11, 16);
              return Card(
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Kiểm tra glucose",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Glucose đo được: ${element['glucoseUI']}')
                    ],
                  ),
                  trailing: Column(
                    children: [
                      const Icon(Icons.timelapse_rounded),
                      Text(timeStr),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      } else if (state is GetHistoryError) {
        return const Center(
          child: Text('Vui lòng chọn một phác đồ để hiển thị lịch sử'),
        );
      } else if (state is GetHistoryLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return const Center(
          child: Text('Không có liên kết'),
        );
      }
    });
  }
}
