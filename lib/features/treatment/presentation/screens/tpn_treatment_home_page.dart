import 'package:doctor_app/features/treatment/presentation/screens/history_treatment.dart';
import 'package:doctor_app/features/treatment/presentation/screens/tpn_treatment_screen.dart';
import 'package:flutter/material.dart';

class TpnTreatmentHomePage extends StatelessWidget {
  const TpnTreatmentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TPN"),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Điều trị"),
              ),
              Tab(child: Text("Lịch sử")),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TpnTreatmentScreen(),
            HistoryTreatment(),
          ],
        ),
      ),
    );
  }
}
