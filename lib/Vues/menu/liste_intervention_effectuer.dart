import 'package:flutter/material.dart';
import 'package:vu_print/Widgets/ChampsSaisie/mon_texte.dart';

class ListeInterventionEffectuer extends StatefulWidget {
  const ListeInterventionEffectuer({super.key});

  @override
  State<ListeInterventionEffectuer> createState() => _ListeInterventionEffectuerState();
}

class _ListeInterventionEffectuerState extends State<ListeInterventionEffectuer> {
  @override
  Widget build(BuildContext context) {
    return Center(child: MonTexte("Listes des interventions effectuer"));
  }
}
