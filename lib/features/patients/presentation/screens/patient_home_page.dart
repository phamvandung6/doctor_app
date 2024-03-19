import 'package:doctor_app/features/patients/presentation/screens/patient_profile.dart';
import 'package:doctor_app/features/regimen/presentation/screens/regimens_screen.dart';
import 'package:flutter/material.dart';

class PatientHomePage extends StatelessWidget {
  const PatientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final objectBloc = context.read<ObjectBloc>();
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Trang chủ bệnh nhân'),
          bottom: TabBar(
            onTap: (index) {},
            tabs: const [
              Tab(
                child: Text(
                  'Hồ sơ bệnh nhân',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Tab(
                child: Text(
                  'Điều trị',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PatientProfile(),
            RegimenScreen(),
          ],
        ),
      ),
    );
  }
}
