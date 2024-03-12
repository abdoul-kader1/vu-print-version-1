import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vu_print/Modeles/technicien.dart';

class PageAccueilOuMdpController extends ChangeNotifier{

  PageAccueilOuMdpController(){
    initUserConnect();
  }

  bool?userIsConnect;
  Technicien technicien = Technicien();

  //initialisation userIsConnect
  Future<void> initUserConnect()async{
    SharedPreferences userIsConnecte = await SharedPreferences.getInstance();
    final connect = userIsConnecte.getBool("userIsConnect")??false;
    userIsConnect = connect;
    notifyListeners();
  }
  //connecter l'utilisateur
  void changeStatusConnexionUser()async{
    SharedPreferences userIsConnecte = await SharedPreferences.getInstance();
    await userIsConnecte.setBool("userIsConnect", true);
    final connect = userIsConnecte.getBool("userIsConnect");
    userIsConnect = connect!;
    notifyListeners();
  }
  //deconnecter l'utilisateur connecter
  void deconnecter()async{
    SharedPreferences userIsConnecte = await SharedPreferences.getInstance();
    await userIsConnecte.setBool("userIsConnect", false);
    final connect = userIsConnecte.getBool("userIsConnect");
    userIsConnect = connect!;
    notifyListeners();
  }

  // modifier l'objet utilisateur
  void updateTechnical(Technicien technical){
    technicien = technical;
    notifyListeners();
  }
}