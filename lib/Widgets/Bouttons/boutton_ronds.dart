import 'package:flutter/material.dart';

class BouttonRond extends StatelessWidget {
  final Color?bgCouleur;final VoidCallback onPressed;final String image;
  const BouttonRond({super.key,required this.bgCouleur,required this.onPressed,required this.image});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}