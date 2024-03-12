import 'package:flutter/material.dart';

import '../../utils/constantes/couleurs.dart';
import '../ChampsSaisie/mon_texte.dart';

class BoxInfoMachineInstallation extends StatelessWidget {
  final String titre;
  const BoxInfoMachineInstallation({super.key,required this.titre});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      width: MediaQuery.of(context).size.width,
      height: 35,
      decoration: BoxDecoration(
          color: VuPrintColors.couleurPrincipale,
          borderRadius: BorderRadius.circular(10)
      ),
      child: MonTexte(titre,couleur: Colors.white,poids: FontWeight.bold),
    );
  }
}
