import 'dart:async';

import 'package:design_system/design_system.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tocata_manager/app/view/bloc/app_bloc.dart';
import 'package:tocata_manager/features/sign_up/sign_up.dart';
import 'package:tocata_manager/features/user_list/view/user_list_page.dart';
import 'package:tocata_manager/firebase_options.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: TocataImages.logo,
          child: Image.asset(
            TocataImages.logo,
            package: TocataImages.packageName,
            height: 30,
          ),
        ),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
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
            Text('Bem-vindo', style: textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(user.name ?? '', style: textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(user.email ?? '', style: textTheme.titleSmall),
            const SizedBox(height: 40),
            Wrap(
              children: [
                _criarUsuario(context),
                _listarUsuarios(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _listarUsuarios(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.of(context).push<void>(UserListPage.route());
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Icon(
                Icons.list_alt_rounded,
                color: Colors.blue.shade900,
                size: 48,
              ),
              Text('Listar usuários', style: textTheme.titleLarge),
            ],
          ),
        ),
      ),
    );
  }

  Widget _criarUsuario(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        try {
          Firebase.initializeApp(
            name: 'secondary',
            options: DefaultFirebaseOptions.currentPlatform,
          ).then(
            (app) async {
              await Navigator.of(context).push<void>(SignUpPage.route(app));
              unawaited(app.delete());
            },
          );
        } catch (e) {
          // TODO: send to Crashlytics.
          print(e);
        }
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Icon(
                Icons.add_reaction_outlined,
                color: Colors.blue.shade900,
                size: 48,
              ),
              Text('Criar usuário', style: textTheme.titleLarge),
            ],
          ),
        ),
      ),
    );
  }
}
