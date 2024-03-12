import 'package:flutter/material.dart';


class MonTexte extends Text{

  MonTexte(String texte,{
    super.key,TextAlign?alignementTexte,Color?couleur,double?taille,FontWeight?poids,double?hauteur,int?maxLines,
    TextOverflow?textOverflow,TextDecoration?textDecoration,Color?decorationColors,double?decorationThickness,String?fontFamily
  }):super(
      texte,
      textAlign: alignementTexte,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
          fontSize: taille,
          fontWeight: poids,
          letterSpacing: 1.5,
          color: couleur,
          height: hauteur,
          fontFamily: fontFamily,
          decoration:textDecoration,
          decorationColor: decorationColors,
          decorationThickness:decorationThickness
      )
  );
}