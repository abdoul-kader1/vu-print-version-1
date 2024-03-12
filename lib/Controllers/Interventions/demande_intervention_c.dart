import 'package:flutter/material.dart';
import 'package:vu_print/Modeles/clients.dart';
import 'package:vu_print/Modeles/intervention_accepter.dart';
import '../../Data/Repository/intervention_accepter_r.dart';
import '../../Data/Repository/nombre_demande_intervention_r.dart';
import '../../Modeles/intervention.dart';

class DemandeInterventionController extends ChangeNotifier{

  DemandeInterventionController(){
    updateListInterventions();updateMesInterventions();
    interventionAccepter();
  }
  List<Intervention>allDemandeIntervention = [];
  List<Intervention>showDemandeIntervention = [];
  List<Intervention>mesInterventions = [];
  List<InterventionAccepter>listeInterventionAccepter = [];
  List<Clients>lesClients = [];
  bool isloadingInterventionAccepter = true;

  Future<void>updateListInterventions()async{
    List<Intervention> list = await NombreDemandeInterventionRepository().getListeDemandeIntervention();
    allDemandeIntervention = list;
    showDemandeIntervention = list;
    notifyListeners();
  }

  Future<void>updateMesInterventions()async{
    List<Intervention> list = await NombreDemandeInterventionRepository().getListeMesIntervention();
    mesInterventions = list;
    notifyListeners();
  }
  Future<void>interventionAccepter()async{
    List<Clients>clients = await getListClient();
    final donnee = await InterventionAccepterRepository().getListeInterventionAccepter(clients);
    listeInterventionAccepter = donnee;
    notifyListeners();
    changeLoaderInterventionAccepter();
  }
  Future<List<Clients>>getListClient()async{
    List<Clients> list = await InterventionAccepterRepository().getListClient();
    return list;
  }

  barreRecheche(String search){
    List<Intervention>suggestion = showDemandeIntervention.where((intervention){
      String requetes = search.toLowerCase();
      String interventions = intervention.motifAppel!;
      return interventions.contains(requetes);
    }).toList();
    allDemandeIntervention = suggestion;
    notifyListeners();
  }
  Future<void>assignerIntervention(int idJournal)async{
    await NombreDemandeInterventionRepository().assignerIntervention(idJournal);
    await updateMesInterventions();
  }
  Future<void>prendreEnChargeIntervention(int idJournal)async{
    await NombreDemandeInterventionRepository().prendreEnChargeIntervention(idJournal);
    await updateMesInterventions();
    await interventionAccepter();
  }
  changeLoaderInterventionAccepter(){
    isloadingInterventionAccepter = ! isloadingInterventionAccepter;
    notifyListeners();
  }

}