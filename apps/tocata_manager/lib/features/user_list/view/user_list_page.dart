import 'package:flutter/material.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const UserListPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text('Olhaaaaa'),
    );
  }
}
