import 'package:doctor_app/features/app/landing_page_bloc/landing_page_bloc.dart';
import 'package:doctor_app/features/app/presentation/landing_page.dart';
import 'package:doctor_app/features/auth_user/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:doctor_app/features/auth_user/presentation/blocs/sign_in_cubit/sign_in_cubit.dart';
import 'package:doctor_app/features/auth_user/presentation/blocs/sign_up_cubit/sign_up_cubit.dart';
import 'package:doctor_app/features/auth_user/presentation/pages/sign_in_screen.dart';
import 'package:doctor_app/features/patients/presentation/blocs/patient_cubit/patient_cubit.dart';
import 'package:doctor_app/features/patients/presentation/blocs/pick_patient_cubit/pick_patient_cubit.dart';
import 'package:doctor_app/features/regimen/presentation/blocs/pick_regimen_cubit/pick_regimen_cubit.dart';
import 'package:doctor_app/features/regimen/presentation/blocs/regimen_cubit/regimen_cubit.dart';
import 'package:doctor_app/features/rooms/presentation/blocs/pick_room_cubit/pick_room_cubit.dart';
import 'package:doctor_app/features/rooms/presentation/blocs/room_cubit/room_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/check_glucose_on_time_cubit/check_glucose_on_time_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/check_time_cubit/check_time_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/get_history_cubit/get_history_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/glucose_cubit/glucose_cubit.dart';
import 'package:doctor_app/features/treatment/presentation/blocs/tpn_cubit/tpn_cubit.dart';
import 'package:doctor_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/main_injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInCubit>(create: (context) => di.sl<SignInCubit>()),
        BlocProvider(create: (context) => di.sl<SignUpCubit>()),
        BlocProvider<LandingPageBloc>(
          create: (context) => LandingPageBloc(),
        ),
        BlocProvider(create: (context) => AuthCubit()..appStarted()),
        BlocProvider(create: (context) => di.sl<RoomCubit>()..fetchRooms()),
        BlocProvider(create: (context) => di.sl<PickRoomCubit>()),
        BlocProvider(create: (context) => di.sl<PatientCubit>()),
        BlocProvider(create: (context) => di.sl<PickPatientCubit>()),
        BlocProvider(create: (context) => di.sl<RegimenCubit>()),
        BlocProvider(create: (context) => di.sl<PickRegimenCubit>()),
        BlocProvider(create: (context) => di.sl<CheckTimeCubit>()),
        BlocProvider(create: (context) => di.sl<TpnCubit>()),
        BlocProvider(create: (context) => GlucoseCubit()),
        BlocProvider(create: (context) => CheckGlucoseOnTimeCubit()),
        BlocProvider(create: (context) => di.sl<GetHistoryCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        // home: const SignInScreen(),
        routes: {
          '/': (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return const LandingPage();
                }
                return const SignInScreen();
              },
            );
          },
        },
      ),
    );
  }
}
