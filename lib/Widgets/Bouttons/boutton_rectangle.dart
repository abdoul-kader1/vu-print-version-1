import 'package:flutter/material.dart';
import '../ChampsSaisie/mon_texte.dart';

class BouttonRectangle extends StatelessWidget {
  final Color?bgCouleur,texteCouleur;final String texte;final VoidCallback onPressed;
  const BouttonRectangle({super.key,this.bgCouleur,this.texteCouleur,required this.onPressed,required this.texte});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width,41),
            backgroundColor: bgCouleur,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13.55),
            )
        ),
        onPressed: onPressed,child: MonTexte(texte,couleur: texteCouleur)
    );
  }
}