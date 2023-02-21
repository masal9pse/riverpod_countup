import 'package:flutter/material.dart';

class AppColors {
  static const accentColor = Color(0xFF3E7FFF);
  static const baseColor = Color(0xFFFFFFFF);
  static const mainColor = Color(0xFF103E68);
}

class AppMaterialColor {
  static const _primaryValue = 0xFF103E68;
  static const primary = MaterialColor(
    _primaryValue,
    {
      50: Color(0xFFE2E8ED),
      100: Color(0xFFB7C5D2),
      200: Color(0xFF889FB4),
      300: Color(0xFF587895),
      400: Color(0xFF345B7F),
      500: Color(_primaryValue),
      600: Color(0xFF0E3860),
      700: Color(0xFF0C3055),
      800: Color(0xFF09284B),
      900: Color(0xFF051B3A),
    },
  );
}