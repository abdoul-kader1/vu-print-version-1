import 'package:flutter/material.dart';
import '../../utils/constantes/couleurs.dart';
import '../ChampsSaisie/mon_texte.dart';

class BoxInfo extends StatelessWidget {
  final String titre;
  const BoxInfo({super.key,required this.titre});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(
          color: VuPrintColors.couleurPrincipale,
          borderRadius: BorderRadius.circular(10)
      ),
      child: MonTexte(titre,couleur: Colors.white,poids: FontWeight.bold),
    );
  }
}
