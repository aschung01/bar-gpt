import 'package:flutter/material.dart';

class ColorManager {
  static const Color primary = Color(0xFFFF3F00);
  static const Color secondary = Color(0xFFFF7F11);
  static const Color gray1 = Color(0xFFF3F3F6);
  static const Color gray2 = Color(0xFFEAEBEF);
  static const Color gray3 = Color(0xFFDFE1E5);
  static const Color gray4 = Color(0xFFCFD4DA);
  static const Color gray5 = Color(0xFFAFB6BD);
  static const Color gray6 = Color(0xFF888D96);
  static const Color gray7 = Color(0xFF4B5057);
  static const Color gray8 = Color(0xFF353A40);
  static const Color gray9 = Color(0xFF222529);
  static Color darkBlue = HexColor.fromHex("#001321");
  static Color black = HexColor.fromHex("#0C0D0E");
  static Color beige = HexColor.fromHex("#BEB7A4");
  static Color white = HexColor.fromHex("#FFFFFC");
  static Color blue = HexColor.fromHex("#1877F2");
  static Color red = HexColor.fromHex("#F22E2E");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF' + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
