import 'package:flutter/material.dart';
import 'package:vu_print/Widgets/ChampsSaisie/mon_texte.dart';
import 'package:vu_print/utils/helper/fonctions.dart';
import '../../utils/constantes/couleurs.dart';

class ContainerLog extends StatelessWidget {

  final String nomClient,modeleCopieur,sousTitre,date,status;
  const ContainerLog({super.key,required this.nomClient,required this.sousTitre,required this.date,required this.modeleCopieur,required this.status});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:VuPrintColors.couleurMotDePasseOublie,
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //photo et information de la machine installée
            Row(
              children: [
                const CircleAvatar(backgroundImage: NetworkImage("https://images.pexels.com/photos/416988/pexels-photo-416988.jpeg?auto=compress&cs=tinysrgb&w=600")),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MonTexte("$nomClient - $modeleCopieur",maxLines: 1,couleur:Colors.white,textOverflow: TextOverflow.ellipsis),
                    MonTexte(sousTitre,couleur:Colors.white),
                  ],
                )
              ],
            ),const Spacer(),
            //affichage de la date
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MonTexte(date,couleur:Colors.white),
                MonTexte(VuPrintFonction.changeTexteStatusJournalActiviter(status),couleur:VuPrintFonction.changeCouleurStatusJournalActiviter(status),taille: 11,poids: FontWeight.bold),
              ],
            )
          ],
        ),
      ),
    );
  }
}
class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    //double w = size.width;
    //double h = size.height;
    Path path_0 = Path();
    path_0.moveTo(size.width*0.0816000,size.height*0.0100000);
    path_0.cubicTo(size.width*0.0136000,size.height*-0.0225000,size.width*-0.0344000,size.height*0.8675000,size.width*0.0016000,size.height*0.9800000);
    path_0.cubicTo(size.width*0.2408000,size.height*0.9825000,size.width*0.7192000,size.height*0.9875000,size.width*0.9584000,size.height*0.9900000);
    path_0.cubicTo(size.width*1.0244000,size.height*0.8950000,size.width*1.0316000,size.height*0.3750000,size.width*0.9600000,size.height*0.2100000);
    path_0.cubicTo(size.width*0.7404000,size.height*0.1600000,size.width*0.7404000,size.height*0.1600000,size.width*0.0816000,size.height*0.0100000);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}
