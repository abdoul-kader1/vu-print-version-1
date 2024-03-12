import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vu_print/Controllers/mode_manuel_c.dart';
import 'package:vu_print/Widgets/ChampsSaisie/input.dart';
import 'package:vu_print/Widgets/ChampsSaisie/mon_texte.dart';
import 'package:vu_print/utils/validator/connexion.dart';
import '../../Widgets/Bouttons/boutton_rectangle.dart';
import '../../utils/constantes/couleurs.dart';
import '../connexion/connexion_screen.dart';

class ModeManuel extends StatefulWidget {
  const ModeManuel({super.key});
  @override
  State<ModeManuel> createState() => _ModeManuelState();
}

class _ModeManuelState extends State<ModeManuel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: VuPrintColors.couleurPrincipale,title: MonTexte("Mode manuel")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: ModeManuelleController.keyFormulaireModeManuel,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MonTexte("Entrée le numéros de série",couleur: VuPrintColors.couleurPrincipale,poids: FontWeight.bold,taille: 17,),const SizedBox(height: 10),
              Input(controller:ModeManuelleController.numerosSerie,validator: VuPrintValidator.verifieChampsNumerosSerie,titre: "210 254 329 IMP 02", masquerSaisie: false,couleurBordure: VuPrintColors.couleurPrincipale),const SizedBox(height: 20),
              Consumer(builder: (ctx,ref,child){
                return Column(
                  children: [
                    BouttonRectangle(
                        onPressed: ()=>ModeManuelleController.soumettre(context,ref),
                        texte: "Valider",
                        bgCouleur: VuPrintColors.couleurBouttonValider,texteCouleur: Colors.white
                    ),const SizedBox(height: 10),
                    ref.watch(authentification).isLoadingNumerosSerie?const CircularProgressIndicator():Container()
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
