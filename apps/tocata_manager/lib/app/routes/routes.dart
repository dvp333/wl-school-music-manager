import 'package:flutter/widgets.dart';
import 'package:tocata_manager/app/view/bloc/app_bloc.dart';
import 'package:tocata_manager/features/acesso_negado/view/acesso_negado_page.dart';
import 'package:tocata_manager/features/home/home.dart';
import 'package:tocata_manager/features/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
    case AppStatus.unauthorized:
      return [AcessoNegadoPage.page()];
  }
}
