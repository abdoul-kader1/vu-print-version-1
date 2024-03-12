import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vu_print/Controllers/Authentifications/connexion_c.dart';
import 'package:vu_print/Widgets/Bouttons/boutton_rectangle.dart';
import 'package:vu_print/Widgets/ChampsSaisie/mon_texte.dart';
import 'package:vu_print/utils/constantes/images.dart';
import 'package:vu_print/utils/validator/connexion.dart';
import '../../Data/Repository/connexion_r.dart';
import '../../Widgets/ChampsSaisie/input.dart';
import '../../utils/constantes/couleurs.dart';

final authentification = ChangeNotifierProvider((ref) =>ConnexionRepository());

class ConnexionScreen extends StatefulWidget {
  const ConnexionScreen({super.key});

  @override
  State<ConnexionScreen> createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child:Form(
          key: ConnexionController.keyFormulaire,
            child: Column(
              children: [
                //logo vu-print
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(VuPrintImages.logo)
                        )
                    ),
                  ),
                ),const SizedBox(height: 20),
                //message de bienvenue
                MonTexte("Bienvenue",poids: FontWeight.w600,fontFamily:'Ingrid Darling',taille: 25,couleur: VuPrintColors.couleurPrincipale),const SizedBox(height: 10),
                MonTexte("entrez votre email et votre mot de passe",taille: 14,),const SizedBox(height: 20),
                //les champs de saisie
                Input(
                    titre:"Email", masquerSaisie: false, couleurBordure: VuPrintColors.couleurPrincipale, prefixIcons: Icons.mail_outline,
                    couleurPrexfixeIcons: VuPrintColors.couleurPrincipale,validator: VuPrintValidator.verifieChampsEmail,controller: ConnexionController.email,
                ),const SizedBox(height: 10),
                Consumer(
                    builder: (ctx,ref,wid){
                      final donnee = ref.watch(authentification).showMdp;
                      return Input(
                        titre: "Mot de passe", masquerSaisie: donnee, couleurBordure: VuPrintColors.couleurPrincipale, prefixIcons: Icons.lock,
                        couleurPrexfixeIcons: VuPrintColors.couleurPrincipale,validator: VuPrintValidator.verifieChampsMdp,controller: ConnexionController.mdp,
                        suffixIcons: IconButton(onPressed: () {ref.read(authentification).changeShowMdp();}, icon: const Icon(Icons.remove_red_eye_outlined),),
                      );
                    }
                ),
                //le texte mot de passe oublié
                Row(
                  children: [const Spacer(), TextButton(onPressed: (){}, child: MonTexte("Mot de passe oublié ?",couleur: VuPrintColors.couleurMotDePasseOublie))],
                ),
                //Boutton de validation
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Consumer(builder: (context,ref,child) {
                    return Column(
                      children: [
                        BouttonRectangle(
                          onPressed: ()=>ConnexionController().validerFormulaire(ref, context, ConnexionController.email.text, ConnexionController.mdp.text), texte: 'se connecter',bgCouleur: VuPrintColors.couleurBouttonValider,
                          texteCouleur: Colors.white,
                        ),const SizedBox(height: 20),
                        ref.watch(authentification).isLoading?const CircularProgressIndicator():Container()
                      ],
                    );
                  },),
                )
              ],
            )
        ),
      ),
    );
  }
}
