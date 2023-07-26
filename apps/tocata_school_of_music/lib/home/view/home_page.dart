import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tocata_school_of_music/app/view/bloc/app_bloc.dart';
import 'package:tocata_school_of_music/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Image.asset(
          TocataImages.logo,
          package: TocataImages.packageName,
          height: 30,
        ),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<AppBloc>().add(const AppLogoutRequested());
            },
          )
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 30),
            Avatar(photo: user.photo),
            const SizedBox(height: 10),
            Text('Bem-vindo', style: textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(user.name ?? '', style: textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(user.email ?? '', style: textTheme.titleSmall),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                //await Navigator.of(context).push<void>(SignUpPage.route(app));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Image.asset(
                        TocataImages.guitarra,
                        package: TocataImages.packageName,
                      ),
                      const SizedBox(height: 15),
                      Text('Guitarra', style: textTheme.titleLarge),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
