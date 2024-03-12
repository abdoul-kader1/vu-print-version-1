import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/constantes/couleurs.dart';
import '../ChampsSaisie/input.dart';
import '../ChampsSaisie/mon_texte.dart';

class BarreRecherche extends StatelessWidget {
  final Function(String)?onChange;
  const BarreRecherche({super.key,this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.15,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
          gradient: LinearGradient(
            begin: Alignment(0.00, -2.00),
            end: Alignment(0, 1),
            colors: [Color(0xFF0661CB), Color(0x009FCBFE)],
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MonTexte("Mes Interventions",poids: FontWeight.w600,taille: 15),
          Container(
            width: MediaQuery.of(context).size.width*0.9,
            child: Input(
              onChanged: onChange,
                titre: "Recherche", masquerSaisie: false,
                couleurBordure: VuPrintColors.couleurPrincipale,
                prefixIcons: FontAwesomeIcons.magnifyingGlass
            ),
          )
        ],
      ),
    );
  }
}
