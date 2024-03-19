import 'package:doctor_app/features/app/landing_page_bloc/landing_page_bloc.dart';
import 'package:doctor_app/features/app/presentation/doctor_screen.dart';
import 'package:doctor_app/features/app/presentation/home_screen.dart';
import 'package:doctor_app/features/app/presentation/setting_screen.dart';
import 'package:doctor_app/features/rooms/presentation/screens/room_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_3_outlined),
    label: 'Bệnh Nhân',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_3_rounded),
    label: 'Bác sĩ',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: 'Cài đặt',
  ),
];

const List<Widget> bottomNavScreen = <Widget>[
  HomeScreen(),
  // PatientScreen(),
  RoomScreen(),
  DoctorScreen(),
  SettingScreen(),
];

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  static const id = 'landing_page';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(child: bottomNavScreen.elementAt(state.tabIndex)),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              context.read<LandingPageBloc>().add(TabChange(tabIndex: index));
            },
          ),
        );
      },
    );
  }
}
