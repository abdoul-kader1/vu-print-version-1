import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vu_print/utils/helper/fonctions.dart';
import '../Data/Services/copieur_s.dart';
import '../Modeles/copieur.dart';
import '../Vues/Mode installation/show_info_machine_manuelle.dart';
import '../Vues/connexion/connexion_screen.dart';
import '../Widgets/ChampsSaisie/mon_texte.dart';

class ModeManuelleController {

  ModeManuelleController();

  static final numerosSerie = TextEditingController();
  static final descriptionDepannage = TextEditingController();
  static final nombreCopieBlancNoire = TextEditingController();
  static final nombreCopieCouleur = TextEditingController();
  static final nombreCassettes = TextEditingController();
  static final observation = TextEditingController();
  static final keyFormulaireModeManuel = GlobalKey<FormState>();
  static final keyFormulairedescriptionDepannage = GlobalKey<FormState>();
  static final keyFormulaireInstallationMachine = GlobalKey<FormState>();

  static Future<void> soumettre(BuildContext context, WidgetRef ref) async {
    if (ModeManuelleController.keyFormulaireModeManuel.currentState!
        .validate()) {
      ref.watch(authentification).changeLoadingNumerosSerie();
      try {
        Copieur copieur = await CopieurServices().getCopieurByNumeroServices(
            numerosSerie.text);
        ref.watch(authentification).changeLoadingNumerosSerie();
        numerosSerie.text = "";
        if (context.mounted) {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) {
                return ShowInfoMachineManuelle(copieur: copieur);
              }));
        }
      } catch (erreur) {
        ref.watch(authentification).changeLoadingNumerosSerie();
        if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: MonTexte(VuPrintFonction.convertirUtf8("$erreur"))));
      }
    }
  }

  static Future<void> depannage(BuildContext context) async {
    if (ModeManuelleController.keyFormulairedescriptionDepannage.currentState!.validate()) {

    }
  }
}