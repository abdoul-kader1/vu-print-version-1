import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vu_print/Widgets/ChampsSaisie/mon_texte.dart';

class ContainerDashboard extends StatelessWidget {
  final String titre,nombre,icone;
  final double largeur;
  final Color couleurArrierePlan;
  const ContainerDashboard({super.key,required this.titre,required this.nombre,required this.largeur,required this.couleurArrierePlan,required this.icone});

  @override
  Widget build(BuildContext context) {
    //parent container
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: largeur,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: couleurArrierePlan,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // icone du dsahboard
          Container(
            width: 40,height: 40,
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
            child:SvgPicture.asset(icone),
          ),
          //information du container dashboard
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MonTexte(titre,couleur: Colors.white),const SizedBox(height: 5),
              MonTexte(nombre,couleur: Colors.white,taille: 17,poids: FontWeight.bold),
            ],
          )
        ],
      ),
    );
  }
}
