import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Name: ${user.displayName}"),
            Text("Email: ${user.email}"),
          ],
        ),
      ),
    );
  }
}
