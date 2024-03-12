import 'package:vu_print/Modeles/logs.dart';
import 'package:vu_print/utils/https/requetes.dart';

class LogRepository{
  Future<List<Log>>getListLog()async{
    List<Log>listeLogs = [];
    final envoieRequete = await VuPrintRequetes.read("calls/interventions/logs");
    List liste = envoieRequete["response"];
    for(var i = 0;i<liste.length;i++){
      Map<String,dynamic> donnee = liste[i];
      listeLogs.add(Log.fromJson(donnee: donnee));
    }
    return listeLogs;
  }
}