import 'package:doctor_app/core/utils/constants/colors.dart';
import 'package:doctor_app/core/utils/widgets/toast.dart';
import 'package:doctor_app/features/app/landing_page_bloc/landing_page_bloc.dart';
import 'package:doctor_app/features/app/presentation/landing_page.dart';
import 'package:doctor_app/features/auth_user/presentation/blocs/sign_in_cubit/sign_in_cubit.dart';
import 'package:doctor_app/features/auth_user/presentation/pages/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late Color myColor;
  late Size mediaSize;

  final LandingPageBloc landingPageBloc = LandingPageBloc();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LandingPage()),
          );
        }
        if (state is SignInError) {
          toast(state.message);
        }
      },
      builder: (context, state) {
        if (state is SignInLoading) {
          return const Scaffold(
            backgroundColor: TColors.lightBlue,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is SignInInitial) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              // Positioned(top: 80, child: _buildTop()),
              Positioned(bottom: 0, child: _buildBottom()),
            ]),
          );
        }
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            // Positioned(top: 80, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom()),
          ]),
        );
      },
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Chào mừng",
            style: TextStyle(fontSize: 32),
          ),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Mật khẩu',
              prefixIcon: Icon(Icons.key),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Theme.of(context).primaryColor,
                  ),
                  width: 140,
                  child: TextButton(
                    onPressed: () {
                      context.read<SignInCubit>().signIn(
                            emailController.text,
                            passwordController.text,
                          );
                    },
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignUpScreen();
                  }));
                },
                child: const Text('Đăng kí'),
              )
            ],
          ),
        ],
      );
    });
  }
}
