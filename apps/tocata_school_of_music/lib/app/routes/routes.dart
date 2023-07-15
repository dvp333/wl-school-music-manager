import 'package:flutter/widgets.dart';
import 'package:tocata_school_of_music/app/view/bloc/app_bloc.dart';
import 'package:tocata_school_of_music/home/home.dart';
import 'package:tocata_school_of_music/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
