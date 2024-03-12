import 'package:flutter/material.dart';

class VuPrintAppBarTheme{
  VuPrintAppBarTheme._();
  static const AppBarTheme modeClaire = AppBarTheme(
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
        color: Colors.white
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black
    )
  );
  static const AppBarTheme modeSombre = AppBarTheme(
    surfaceTintColor: Colors.transparent,
  );
}