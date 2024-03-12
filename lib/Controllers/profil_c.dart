import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vu_print/Data/Repository/profil_r.dart';
import 'package:vu_print/Modeles/technicien.dart';
import 'package:vu_print/main.dart';

import '../Widgets/ChampsSaisie/mon_texte.dart';

class ProfilController{

  static final TextEditingController nom = TextEditingController();
  static final TextEditingController moyenDeplacement = TextEditingController();
  static final TextEditingController number = TextEditingController();
  static final TextEditingController zoneIntervention = TextEditingController();

  static Future<void>validation(WidgetRef ref,Technicien technicien,BuildContext context,BuildContext ctx)async{
    try{
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (ctx){
            return AlertDialog(
              content:Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MonTexte("Veuillez patienter"),const SizedBox(height: 20),
                  const CircularProgressIndicator()
                ],
              ),
            );
          }
      );
      await ProfilRepository.updateInfoUser(nomPrenom: nom.text.trim(), moyenDeplacement: moyenDeplacement.text.trim(), mobile: number.text.trim(), zoneIntervention: zoneIntervention.text.trim(), technicien: technicien);
      Technicien newTechnicien = await ProfilRepository.getTechnicien(technicien.user!.userId!);
      ref.read(userIsConnect).updateTechnical(newTechnicien);
      if(context.mounted)Navigator.pop(context);
      if(context.mounted)Navigator.pop(ctx);
      nom.text ="";
      moyenDeplacement.text ="";
      number.text ="";
      zoneIntervention.text ="";
    }catch(ereur){
      if(context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: MonTexte("$ereur")));
    }
  }
}