class Clients {
  int?clientId,userId;
  String?clientNom,localisation,adresse,telephone,fax,horaires,noContrat,dateContrat,docContrat,dateEntrer,dateModification,status;
  List<dynamic>?interlocauteurs,copieurs;

  Clients();
  Clients.fromJson({required Map<String,dynamic>donnee}){
    clientId = donnee["clientId"];
    userId = donnee["userId"];
    clientNom = donnee["clientNom"];
    localisation = donnee["localisation"];
    adresse = donnee["adresse"];
    telephone = donnee["telephone"];
    fax = donnee["fax"];
    horaires = donnee["horaires"];
    noContrat = donnee["noContrat"];
    dateContrat = donnee["dateContrat"];
    docContrat = donnee["docContrat"];
    dateEntrer = donnee["dateEntrer"];
    dateModification = donnee["dateModification"];
    status = donnee["status"];
    interlocauteurs = donnee["interlocauteurs"];
    copieurs = donnee["copieurs"];
  }

}
