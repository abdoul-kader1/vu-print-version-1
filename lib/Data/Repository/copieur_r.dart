import 'package:vu_print/utils/https/requetes.dart';

class CopieurRepository {

  CopieurRepository();

  Future<Map<String,dynamic>>getCopieurByNumeroSerie(String numeroSerie)async{
    return VuPrintRequetes.read("copier/noserie/$numeroSerie");
  }
}