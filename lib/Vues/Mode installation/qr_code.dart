import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:vu_print/Widgets/ChampsSaisie/mon_texte.dart';
import 'package:vu_print/utils/constantes/couleurs.dart';
import '../../Widgets/Bouttons/boutton_rectangle.dart';
import '../../Widgets/others/box_info.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        future: lanceScanner(),
        builder: (ctx, snapshot) {
          return snapshot.hasData
              ? Scaffold(
                  appBar: AppBar(
                      title: MonTexte("Information de machine"),
                      backgroundColor: VuPrintColors.couleurPrincipale),
                  body: (snapshot.data=="-1")?Center(child: MonTexte("Aucun Qr code trouver")):SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MonTexte(snapshot.data!),
                        MonTexte("Constructeur",couleur: VuPrintColors.couleurPrincipale,poids: FontWeight.bold,taille: 17,),const SizedBox(height: 10),
                        const BoxInfo(titre:"Charp"),const SizedBox(height: 20),
                        MonTexte("Modele",couleur: VuPrintColors.couleurPrincipale,poids: FontWeight.bold,taille: 17,),const SizedBox(height: 10),
                        const BoxInfo(titre:"KXZEP-performe"),const SizedBox(height: 20),
                        MonTexte("N° de serie",couleur: VuPrintColors.couleurPrincipale,poids: FontWeight.bold,taille: 17,),const SizedBox(height: 10),
                        const BoxInfo(titre:"210 254 329 imp 02"),const SizedBox(height: 20),
                        MonTexte("Lieu de Stockage",couleur: VuPrintColors.couleurPrincipale,poids: FontWeight.bold,taille: 17,),const SizedBox(height: 10),
                        const BoxInfo(titre:"Embimpé entrepot n °23"),const SizedBox(height: 40),
                        BouttonRectangle(onPressed: (){}, texte: "Installation",bgCouleur: VuPrintColors.couleurBouttonValider,texteCouleur: Colors.white),const SizedBox(height: 10),
                        BouttonRectangle(onPressed: (){}, texte: "Dépannage",bgCouleur: VuPrintColors.couleurBouttonValider,texteCouleur: Colors.white),const SizedBox(height: 10),
                        BouttonRectangle(onPressed: (){}, texte: "Reprise",bgCouleur: VuPrintColors.couleurBouttonValider,texteCouleur: Colors.white)
                      ],
                    ),
                  ),
                )
              :const Scaffold(
                  body: Center(child: CircularProgressIndicator()));
        });
  }

  Future<String?> lanceScanner() async {
    String? valeur;
    try {
      valeur = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Annuler", true, ScanMode.QR);
      /*setState(() {
        valeurScann = valeur;
      });*/
    } catch (e) {
      if (kDebugMode) {
        print("erreur scann Qr code : $e");
      }
    }
    return valeur;
  }
}

/*
Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Image.network("http://api.qrserver.com/v1/create-qr-code/?data=https://frametech-ci.com/&size=100x100&color=1290CB"),
                        const SizedBox(width: 20),
                        QrImageView(
                          data: "https://frametech-ci.com",
                          gapless: false,
                          padding: const EdgeInsets.all(0),
                          size: 100.0,
                          eyeStyle: const QrEyeStyle(
                              color: VuPrintColors.couleurPrincipale,
                              eyeShape: QrEyeShape.circle),
                          dataModuleStyle: const QrDataModuleStyle(
                              color: VuPrintColors.couleurBlack),
                          //embeddedImage: const AssetImage(VuPrintImages.logo,),
                          //embeddedImageStyle: const QrEmbeddedImageStyle(size: Size(44,25)),
                        ),
                        MonTexte(snapshot.data!)
                      ],
                    )
 */
