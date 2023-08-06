import 'package:flutter/widgets.dart';
import 'package:fretz/app/view/bloc/app_bloc.dart';
import 'package:fretz/features/main_menu/view/main_menu_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.initialized:
      return [MainMenuPage.page()];
  }
}
