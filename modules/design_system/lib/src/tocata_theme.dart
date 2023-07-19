import 'dart:convert';

import 'package:design_system/src/model/theme_assets.dart';
import 'package:design_system/src/model/theme_values.dart';
import 'package:design_system/src/theme_factory.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/services.dart';

class TocataTheme {
  static Future<material.ThemeData> load(
    material.BuildContext context,
    ThemeAssets themeAsset,
  ) async {
    final json = jsonDecode(
      await rootBundle.loadString(themeAsset.asset),
    ) as Map<String, dynamic>;
    final themeValues = ThemeValues.fromJson(json);
    return ThemeFactory.of(themeValues).theme.copyWith(
          // TODO: retirar tema do input text hardcoded
          inputDecorationTheme: const material.InputDecorationTheme(
            enabledBorder: material.UnderlineInputBorder(
              borderSide: material.BorderSide(color: material.Colors.white),
            ),
            labelStyle: material.TextStyle(color: material.Colors.white),
            focusedBorder: material.UnderlineInputBorder(
              borderSide:
                  material.BorderSide(color: material.Colors.white, width: 2.0),
            ),
          ),
        );
  }
}
