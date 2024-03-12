import 'package:vu_print/Data/Repository/copieur_r.dart';
import '../../Modeles/copieur.dart';

class CopieurServices{

  CopieurServices();

  Future<Copieur>getCopieurByNumeroServices(String numeroSerie)async{
    final envoieRequetes = await CopieurRepository().getCopieurByNumeroSerie(numeroSerie);
    return Copieur.fromJson(donnee: envoieRequetes["response"]);
  }
}