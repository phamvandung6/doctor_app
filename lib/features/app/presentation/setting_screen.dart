import 'package:doctor_app/features/auth_user/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting screen"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Setting screen"),
            ElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().loggedOut();
              },
              child: const Text("Đăng xuất"),
            )
          ],
        ),
      ),
    );
  }
}
