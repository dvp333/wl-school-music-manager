import 'package:design_system/design_system.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tocata_manager/app/injection/injector.dart';
import 'package:tocata_manager/app/l10n/l10n.dart';
import 'package:tocata_manager/app/routes/routes.dart';
import 'package:tocata_manager/app/view/bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AppBloc>(),
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late Future<ThemeData> _theme;

  @override
  void initState() {
    super.initState();
    _theme = TocataTheme.load(context, ThemeAssets.light);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _theme,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            theme: snapshot.data,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: FlowBuilder<AppStatus>(
              state: context.select((AppBloc bloc) => bloc.state.status),
              onGeneratePages: onGenerateAppViewPages,
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
