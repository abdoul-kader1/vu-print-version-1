import 'package:flutter/material.dart';
import 'package:vu_print/utils/themes/theme%20personnaliser/app_bar_theme.dart';
import '../constantes/couleurs.dart';

class VuPrintTheme{
  VuPrintTheme._();
  static ThemeData modeClaire = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: VuPrintColors.couleurPrincipale,
        brightness: Brightness.light
    ),
      useMaterial3: true,
      appBarTheme: VuPrintAppBarTheme.modeClaire,
  );
  static ThemeData modeSonbre = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: VuPrintColors.couleurPrincipale,
        brightness: Brightness.dark
    ),
      useMaterial3: true,
      appBarTheme: VuPrintAppBarTheme.modeSombre,
  );
}