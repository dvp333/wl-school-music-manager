import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tocata_school_of_music/app/injection/injector.dart';
import 'package:tocata_school_of_music/sign_up/sign_up.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        title: const Text('Novo usuário'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocProvider<SignUpCubit>(
            create: (_) => getIt<SignUpCubit>(),
            child: const SignUpForm(),
          ),
        ),
      ),
    );
  }
}
