import 'package:flutter/material.dart';
import 'package:vu_print/Modeles/clients.dart';
import '../../Data/Repository/intervention_accepter_r.dart';

class InstallationMachineController extends ChangeNotifier{

  InstallationMachineController(){
    getListClient();
  }

  List<Clients>clients = [];
  int idClientInitial = 0;

  Future<void>getListClient()async{
    List<Clients> list = await InterventionAccepterRepository().getListClient();
    clients = list;
    idClientInitial = list[0].clientId!;
    notifyListeners();
  }

  void changeValeurInitiale(int?valeur){
    idClientInitial = valeur!;
    notifyListeners();
  }
}