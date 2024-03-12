import 'package:flutter/material.dart';

class FaireIntervention extends StatefulWidget {
  const FaireIntervention({super.key});

  @override
  State<FaireIntervention> createState() => _FaireInterventionState();
}

class _FaireInterventionState extends State<FaireIntervention> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.lightGreen,
    );
  }
}
