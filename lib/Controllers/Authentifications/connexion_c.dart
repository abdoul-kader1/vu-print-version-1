import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vu_print/Data/Repository/connexion_r.dart';
import 'package:vu_print/Modeles/technicien.dart';
import '../../Vues/connexion/connexion_screen.dart';
import '../../Widgets/ChampsSaisie/mon_texte.dart';
import '../../main.dart';

class ConnexionController{

  static final email = TextEditingController();
  static final mdp = TextEditingController();
  static final keyFormulaire = GlobalKey<FormState>();

  Connectivity connectivity = Connectivity();

    Future<void>validerFormulaire(WidgetRef ref,BuildContext context, String emails,String mdps)async{
    if(keyFormulaire.currentState!.validate()){
      // lancer le chargement
      ref.read(authentification).changeLoading();
      final verificationConnexionUser = await connectivity.checkConnectivity();
      if(verificationConnexionUser == ConnectivityResult.wifi || verificationConnexionUser == ConnectivityResult.mobile || verificationConnexionUser == ConnectivityResult.ethernet || verificationConnexionUser == ConnectivityResult.vpn){
        try{
          Technicien technicien = await ConnexionRepository.seConnecter(email: email.text.trim(), mdp: mdp.text.trim());
          ref.read(userIsConnect).changeStatusConnexionUser();
          ref.read(userIsConnect).updateTechnical(technicien);
          SharedPreferences userId = await SharedPreferences.getInstance();
          await userId.setInt("userId", technicien.user!.userId!);
          email.text = "";
          mdp.text = "";
        }catch(ereeur){
          if(context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: MonTexte("$ereeur")));
        }
        //arreter le chargement
        ref.read(authentification).changeLoading();
      }else{
        // arreter le chargement
        ref.read(authentification).changeLoading();
        if(context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: MonTexte("Vous n'avez pas de connexion internet")));
      }
    }
  }
}
