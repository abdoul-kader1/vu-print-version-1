import 'package:shared_preferences/shared_preferences.dart';
import 'package:vu_print/Modeles/intervention_accepter.dart';
import '../../Modeles/clients.dart';
import '../../Modeles/copieur.dart';
import '../../Modeles/intervention.dart';
import '../../utils/https/requetes.dart';

class InterventionAccepterRepository{
  
  InterventionAccepterRepository();
  
  Future<Clients>getClient(int idClient)async{
    final envoieRequetes = await VuPrintRequetes.read("client/$idClient");
    Clients client = Clients.fromJson(donnee: envoieRequetes["response"]);
    return client;
  }

  Future<List<Clients>>getListClient()async{
    List<Clients>listeClient = [];
    final envoieRequetes = await VuPrintRequetes.read("client/all");
    List<dynamic>lesClients = envoieRequetes["response"];
    for(var i = 0;i<lesClients.length;i++){
      Map<String,dynamic>client = lesClients[i];
      listeClient.add(Clients.fromJson(donnee: client));
    }
    return listeClient;
  }
  
  Future<Copieur>getCopieurs(int idCopieur)async{
    final envoieRequetes = await VuPrintRequetes.read("copier/$idCopieur");
    Copieur copieur = Copieur.fromJson(donnee: envoieRequetes["response"]);
    return copieur;
  }

  Future<Copieur>getCopieur(List<dynamic>copieur,idCopieur)async{
    List<Copieur>listeCopieur = [];
    Copieur copieurs = Copieur();
    if(copieur.isEmpty){
      listeCopieur = [];
    }else{
      for(var i = 0;i<copieur.length;i++){
        Map<String,dynamic>copieurs = copieur[i];
        listeCopieur.add(Copieur.fromJson(donnee: copieurs));
      }
      copieurs = listeCopieur.firstWhere((element) => element.copieurId == idCopieur);
    }
    return copieurs;
  }

  Future<List<InterventionAccepter>>getListeInterventionAccepter(List<Clients>listeClient)async{
    SharedPreferences userId = await SharedPreferences.getInstance();
    final id = userId.getInt("userId");
    List<InterventionAccepter>list = [];
    final envoieRequetes = await VuPrintRequetes.read("calls/assigned/technician/$id");
    //final listeClients = await getListClient();
    //final listeClient = DemandeInterventionController().lesClients;
    List<dynamic>nombre = envoieRequetes["response"];
    for(var i = 0;i<nombre.length;i++){
      Map<String,dynamic>donnee = nombre[i];
      Intervention intervention = Intervention.fromJson(donnee: donnee);
      final client = listeClient.firstWhere((element) => element.clientId == intervention.clientId);
      final copieur = await getCopieur(client.copieurs!,intervention.copieurId!);
      list.add(InterventionAccepter(
          nomClient: client.clientNom!,adresseClients: client.adresse!,telephoneClients: client.telephone!,
          modeleCopieur: copieur.model!, constructeurCopieur: copieur.constructeur!,numeroSerieCopieur: copieur.noSerie!,
          modifAppel: intervention.motifAppel!,dateAppel:intervention.dateAppel!,statusAffectation: intervention.affectations![0]["status"]
      )
      );
    }
    return list;
  }
  Future<void>faireInstallationMachine({
    required int idCopieur,required int idClients,required String objet,required String composition,
    required int nombreCassette,required String fonctions,required String volumeMensuel,required String observation,
    required String dateInstallation,
  })async{
    final donnee = {
      "clientId": idClients,
      "userId": 1,
      "objet": objet,
      "composition": composition,
      "nbreCassette": nombreCassette,
      "fonctions": fonctions,
      "volumeMensuel": volumeMensuel,
      "observation": observation,
      "dateInstallation": dateInstallation,
      "compteurs": [ ]
    };
    await VuPrintRequetes.create("copier/15/deployment", donnee);
  }
}