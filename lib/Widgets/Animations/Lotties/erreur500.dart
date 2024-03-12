import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/constantes/lotties.dart';
import '../../ChampsSaisie/mon_texte.dart';

class Erreur500 extends StatelessWidget {
  const Erreur500({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 300,height: 300,
              child: Lottie.asset(VuPrintLotties.erreur500),
            ),
          ),
          MonTexte("Oupss probleme de seveur")
        ],
      ),
    );
  }
}
