import 'package:flutter/cupertino.dart';
import 'package:vu_print/Modeles/technicien.dart';
import '../../utils/https/requetes.dart';

class ConnexionRepository extends ChangeNotifier{

  bool isLoading = false;
  bool isLoadingNumerosSerie = false;
  bool showMdp = true;

  changeLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }
  changeLoadingNumerosSerie(){
    isLoadingNumerosSerie = !isLoadingNumerosSerie;
    notifyListeners();
  }

  changeShowMdp(){
    showMdp = !showMdp;
    notifyListeners();
  }
  //connexion de l'utilisateur
  static Future<Technicien>seConnecter({required String email,required String mdp})async{
    Map<String,dynamic>envoieDonnee = {
      "username":email,
      "password":mdp
    };
    final requeteBdd = await VuPrintRequetes.create("technician/login", envoieDonnee);
    Technicien technicien = Technicien.fromJson(donnee: requeteBdd["response"]);
    return technicien;
  }
}