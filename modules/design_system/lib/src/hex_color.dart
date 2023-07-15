import 'dart:ui';

class HexColor {
  const HexColor();

  static Color? fromHex(String? hexString) {
    if (hexString == null) return null;
    return Color(int.parse(hexString.replaceFirst('#', ''), radix: 16));
  }
}
