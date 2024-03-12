import 'package:flutter/material.dart';
import 'package:vu_print/Vues/page_accueil_ou_mdp.dart';
import 'package:vu_print/utils/themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vu print',
      darkTheme: VuPrintTheme.modeSonbre,
      theme: VuPrintTheme.modeClaire,
      home: const PageAccueilOuMpd(),
    );
  }
}