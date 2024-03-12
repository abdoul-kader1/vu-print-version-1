import 'package:flutter/material.dart';
import 'package:vu_print/Controllers/mode_manuel_c.dart';
import 'package:vu_print/utils/helper/fonctions.dart';
import 'package:vu_print/utils/validator/connexion.dart';
import '../../Modeles/copieur.dart';
import '../../Widgets/Bouttons/boutton_rectangle.dart';
import '../../Widgets/ChampsSaisie/input.dart';
import '../../Widgets/ChampsSaisie/mon_texte.dart';
import '../../Widgets/others/box_info.dart';
import '../../utils/constantes/couleurs.dart';
import '../menu/installation_machine.dart';

class ShowInfoMachineManuelle extends StatelessWidget {

  final Copieur copieur;
  const ShowInfoMachineManuelle({super.key,required this.copieur});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: MonTexte("Information de machine"),
          backgroundColor: VuPrintColors.couleurPrincipale,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MonTexte("Constructeur",couleur: VuPrintColors.couleurPrincipale,poids: FontWeight.bold,taille: 17,),const SizedBox(height: 10),
            BoxInfo(titre:copieur.constructeur!),const SizedBox(height: 20),
            MonTexte("Modele",couleur: VuPrintColors.couleurPrincipale,poids: FontWeight.bold,taille: 17,),const SizedBox(height: 10),
            BoxInfo(titre:copieur.model!),const SizedBox(height: 20),
            MonTexte("N° de serie",couleur: VuPrintColors.couleurPrincipale,poids: FontWeight.bold,taille: 17,),const SizedBox(height: 10),
            BoxInfo(titre:copieur.noSerie!),const SizedBox(height: 20),
            MonTexte("Lieu de Stockage",couleur: VuPrintColors.couleurPrincipale,poids: FontWeight.bold,taille: 17,),const SizedBox(height: 10),
            BoxInfo(titre:copieur.stokage!),const SizedBox(height: 40),
            BouttonRectangle(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx){
                        return InstallationMachine(idCopieur: copieur.copieurId!);
                      })
                  );
                }, texte: "Installation",bgCouleur: VuPrintColors.couleurBouttonValider,
                texteCouleur: Colors.white
            ),const SizedBox(height: 10),
            BouttonRectangle(
                onPressed: (){
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (ctx){
                        return AlertDialog(
                          contentPadding: const EdgeInsets.all(15),
                          title: MonTexte("Depannage"),
                          content: Form(
                            key: ModeManuelleController.keyFormulairedescriptionDepannage,
                            child: Input(validator: VuPrintValidator.verifieChampsDescriptionDepannage,controller:ModeManuelleController.descriptionDepannage,titre: "description intervention", masquerSaisie: false, couleurBordure: VuPrintColors.couleurPrincipale),
                          ),
                          actions: [
                            SizedBox(width: 130,child: BouttonRectangle(onPressed: (){Navigator.pop(context);}, texte: 'Annuler')),
                            SizedBox(width: 130,child: BouttonRectangle(onPressed: ()=>ModeManuelleController.depannage(context), texte: 'Valider')),
                          ],
                        );
                      }
                  );
                },
                texte: "Dépannage",bgCouleur: VuPrintColors.couleurBouttonValider,
                texteCouleur: Colors.white
            ),const SizedBox(height: 10),
            BouttonRectangle(onPressed: (){}, texte: "Reprise",bgCouleur: VuPrintColors.couleurBouttonValider,texteCouleur: Colors.white)
          ],
        ),
      ),
    );
  }
}
