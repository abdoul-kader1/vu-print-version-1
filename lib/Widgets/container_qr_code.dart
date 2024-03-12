import 'package:flutter/material.dart';
import 'package:vu_print/utils/constantes/couleurs.dart';

class ContainerQrCode extends StatelessWidget {
  final String image;
  final VoidCallback onTap;
  const ContainerQrCode({super.key,required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 100,height: 100,
        decoration: BoxDecoration(
            color: VuPrintColors.couleurGrise.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: VuPrintColors.couleurPrincipale,
                width: 3
            )
        ),
        child: Image.asset(image,height: 50,width: 50),
      ),
    );
  }
}
