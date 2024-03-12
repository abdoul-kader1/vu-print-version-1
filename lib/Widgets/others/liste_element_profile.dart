import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/constantes/couleurs.dart';
import '../ChampsSaisie/mon_texte.dart';

class ListeElementProfile extends StatelessWidget {
  final String titre;
  const ListeElementProfile({super.key,required this.titre});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,height: 50,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: VuPrintColors.couleurMotDePasseOublie)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MonTexte(titre,couleur: Theme.of(context).colorScheme.onBackground,),
            const Icon(FontAwesomeIcons.circleChevronRight,size:20,color: VuPrintColors.couleurMotDePasseOublie)
          ],
      ),
    );
  }
}
