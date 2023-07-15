import 'package:design_system/src/hex_color.dart';
import 'package:design_system/src/model/theme_values.dart';
import 'package:flutter/material.dart';

class ThemeFactory {
  ThemeFactory._({
    required this.theme,
  });

  factory ThemeFactory.of(ThemeValues themeValues) {
    final colorScheme = ThemeData().colorScheme.copyWith(
          primary: HexColor.fromHex(themeValues.colorScheme!.primary),
          primaryContainer:
              HexColor.fromHex(themeValues.colorScheme!.primaryContainer),
          secondary: HexColor.fromHex(themeValues.colorScheme!.secondary),
          secondaryContainer:
              HexColor.fromHex(themeValues.colorScheme!.secondaryContainer),
          background: HexColor.fromHex(themeValues.colorScheme!.background),
          error: HexColor.fromHex(themeValues.colorScheme!.error),
          surface: HexColor.fromHex(themeValues.colorScheme!.surface),
          onError: HexColor.fromHex(themeValues.colorScheme!.onError),
          onPrimary: HexColor.fromHex(themeValues.colorScheme!.onPrimary),
          onBackground: HexColor.fromHex(themeValues.colorScheme!.onBackground),
          onSecondary: HexColor.fromHex(themeValues.colorScheme!.onSecondary),
          onSurface: HexColor.fromHex(themeValues.colorScheme!.onSurface),
          brightness: themeValues.brightness == 'dark'
              ? Brightness.dark
              : Brightness.light,
        );

    final themeData = ThemeData(
      colorScheme: colorScheme,
    );

    return ThemeFactory._(
      theme: themeData,
    );
  }

  final ThemeData theme;
}
