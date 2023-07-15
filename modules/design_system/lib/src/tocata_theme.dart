import 'dart:convert';

import 'package:design_system/src/model/theme_assets.dart';
import 'package:design_system/src/model/theme_values.dart';
import 'package:design_system/src/theme_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TocataTheme {
  static Future<ThemeData> load(
    BuildContext context,
    ThemeAssets themeAsset,
  ) async {
    final json = jsonDecode(
      await rootBundle.loadString(themeAsset.asset),
    ) as Map<String, dynamic>;
    final themeValues = ThemeValues.fromJson(json);
    return ThemeFactory.of(themeValues).theme;
  }
}
