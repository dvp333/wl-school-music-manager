import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tocata_manager/app/view/bloc/app_bloc.dart';

class AcessoNegadoPage extends StatelessWidget {
  const AcessoNegadoPage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: AcessoNegadoPage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              context.read<AppBloc>().add(const AppLogoutRequested());
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 30),
            Text(
              'Infelizmente você não possui acesso a este aplicativo.',
              textAlign: TextAlign.center,
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                context.read<AppBloc>().add(const AppLogoutRequested());
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.blue.shade900,
                        size: 48,
                      ),
                      Text('Sair', style: textTheme.titleLarge),
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
