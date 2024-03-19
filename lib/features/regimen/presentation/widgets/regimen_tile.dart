import 'package:doctor_app/core/utils/functions/convert_time.dart';
import 'package:doctor_app/features/regimen/domain/entities/regimen_entity.dart';
import 'package:doctor_app/features/regimen/presentation/blocs/pick_regimen_cubit/pick_regimen_cubit.dart';
import 'package:doctor_app/features/regimen/presentation/blocs/regimen_cubit/regimen_cubit.dart';
import 'package:doctor_app/features/rooms/presentation/widgets/popup_menu.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/check_time_cubit/check_time_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/screens/tpn_treatment_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegimenTile extends StatelessWidget {
  const RegimenTile({super.key, required this.regimen});
  final RegimenEntity regimen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<PickRegimenCubit>().pickRegimen(regimen: regimen);
        context.read<CheckTimeCubit>().checkTime();
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: BlocProvider.of<RegimenCubit>(context),
              child: const TpnTreatmentHomePage(),
            );
          },
        ));
      },
      tileColor: const Color(0xffFAF6F0),
      leading: CircleAvatar(
        backgroundColor: const Color(0xff9EB8D9),
        child: Text(regimen.name!),
      ),
      title: Text('Tên phác đồ: ${regimen.name}'),
      subtitle: Text(
          'Ngày điều trị: ${timestampToDateTime(regimen.beginTime!).toIso8601String()}'),
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
                          .read<RegimenCubit>()
                          .deleteRegimen(regimen: regimen);
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
