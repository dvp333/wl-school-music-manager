import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tocata_manager/app/injection/injector.dart';
import 'package:tocata_manager/features/sign_up/sign_up.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    required this.app,
    super.key,
  });

  final FirebaseApp app;

  static Route<void> route(FirebaseApp app) {
    return MaterialPageRoute<void>(builder: (_) => SignUpPage(app: app));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        title: const Text('Criar usuário'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: BlocProvider<SignUpCubit>(
            create: (_) => getIt<SignUpCubit>(
              param1: app,
            ),
            child: const SignUpForm(),
          ),
        ),
      ),
    );
  }
}
