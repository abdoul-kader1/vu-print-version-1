import 'package:vu_print/Modeles/technicien.dart';
import 'package:vu_print/utils/https/requetes.dart';

class ProfilRepository{

  static Future<void>updateInfoUser({
    String?nomPrenom,String?moyenDeplacement,
    String?mobile,String?zoneIntervention,required Technicien technicien
  })async{

    final donnee = {
      "userId": technicien.user!.userId!,
      //"technicienNom": nomPrenom??"${technicien.user!.lastname} ${technicien.user!.firstname}",
      "technicienQualification": technicien.technicienQualification,
      "technicienSpecialite": technicien.technicienSpecialite,
      "moyenDeplacement": moyenDeplacement!.isEmpty?"${technicien.moyenDeplacement}":moyenDeplacement,
      "technicienStatus": technicien.status,
      "technicienContact": mobile!.isEmpty?"${technicien.user!.mobile}":mobile,
      "zoneIntervention": zoneIntervention!.isEmpty?"${technicien.zoneIntervention}":zoneIntervention
    };
    await VuPrintRequetes.update("technician/${technicien.user!.userId}",donnee);
  }

  static Future<Technicien>getTechnicien(int idUser)async{
    final envoieRequetes = await VuPrintRequetes.read("technician/$idUser");
    Technicien technicien = Technicien.fromJson(donnee: envoieRequetes["response"]);
    return technicien;
  }
}