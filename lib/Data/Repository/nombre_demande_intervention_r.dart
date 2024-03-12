import 'package:shared_preferences/shared_preferences.dart';
import 'package:vu_print/Modeles/intervention.dart';
import 'package:vu_print/utils/https/requetes.dart';

class NombreDemandeInterventionRepository{

  Future<String>getNombreDemandeIntervention()async{
    final envoieRequetes = await VuPrintRequetes.read("calls/untreated");
    List nombre = envoieRequetes["response"];
    return nombre.length.toString();
  }
  Future<String>getNombreInterventionEffectuer()async{
    SharedPreferences userId = await SharedPreferences.getInstance();
    final id = userId.getInt("userId");
    final envoieRequetes = await VuPrintRequetes.read("calls/interventions/from/2024-01-24/technician/$id");
    List nombre = envoieRequetes["response"];
    return nombre.length.toString();
  }
  Future<List<Intervention>>getListeDemandeIntervention()async{
    List<Intervention>list = [];
    final envoieRequetes = await VuPrintRequetes.read("calls/untreated");
    List<dynamic>nombre = envoieRequetes["response"];
    for(var i = 0;i<nombre.length;i++){
      Map<String,dynamic>donnee = nombre[i];
      list.add(Intervention.fromJson(donnee: donnee));
    }
    return list;
  }
  Future<String>getNombreMesInterventions()async{
    SharedPreferences userId = await SharedPreferences.getInstance();
    final id = userId.getInt("userId");
    final envoieRequetes = await VuPrintRequetes.read("calls/assigned/technician/$id");
    List nombre = envoieRequetes["response"];
    return nombre.length.toString();
  }
  Future<List<Intervention>>getListeMesIntervention()async{
    SharedPreferences userId = await SharedPreferences.getInstance();
    final id = userId.getInt("userId");
    List<Intervention>list = [];
    final envoieRequetes = await VuPrintRequetes.read("calls/assigned/technician/$id");
    List<dynamic>nombre = envoieRequetes["response"];
    for(var i = 0;i<nombre.length;i++){
      Map<String,dynamic>donnee = nombre[i];
      list.add(Intervention.fromJson(donnee: donnee));
    }
    return list;
  }
  
  Future<void>assignerIntervention(int idJournal)async{
    SharedPreferences userId = await SharedPreferences.getInstance();
    final id = userId.getInt("userId");
    Map<String,dynamic>donnee = {
      "userId": 1,
      "techniciens": [id]
    };
    final envoieRequetes  = await VuPrintRequetes.create("call/$idJournal/assign/technician",donnee);
  }

  Future<void>prendreEnChargeIntervention(int idJournal)async{
    SharedPreferences userId = await SharedPreferences.getInstance();
    final id = userId.getInt("userId");
    final donnee = await VuPrintRequetes.read("call/$idJournal/assigned/technician/$id/supported");
  }

}