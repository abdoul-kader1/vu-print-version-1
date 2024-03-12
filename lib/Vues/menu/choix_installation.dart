import 'package:flutter/material.dart';
import 'package:vu_print/Vues/Mode%20installation/qr_code.dart';
import 'package:vu_print/Widgets/ChampsSaisie/mon_texte.dart';
import 'package:vu_print/utils/constantes/images.dart';
import 'package:vu_print/utils/helper/fonctions.dart';
import '../../Widgets/container_qr_code.dart';
import '../../utils/constantes/couleurs.dart';
import '../Mode installation/manuel.dart';

class ChoixInstallations extends StatelessWidget {
  const ChoixInstallations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: VuPrintColors.couleurPrincipale,title: MonTexte("Mode de selection")),
      body: Center(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerQrCode(
                    onTap: (){VuPrintFonction.chancePage(context,(ctx)=>const QrCode());},
                    image: VuPrintImages.qrcode
                ),MonTexte("Qr code")
              ],
            ),const SizedBox(width: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContainerQrCode(
                  image: VuPrintImages.manuel,
                  onTap: () {VuPrintFonction.chancePage(context,(ctx)=>const ModeManuel());},
                ),MonTexte("Manuel")
              ],
            )
          ],
        )
      ),
    );
  }
}
