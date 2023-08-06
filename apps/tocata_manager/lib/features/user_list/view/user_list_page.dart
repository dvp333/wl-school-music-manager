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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.list_alt_rounded,
              color: Colors.blue.shade900,
              size: 80,
            ),
            const Text(
              'Em breve...',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }
}
