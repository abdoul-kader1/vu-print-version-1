class Intervention {

  int?journalId,clientId,copieurId,userId;
  String?dateAppel,dateEntrer, dateModification,motifAppel,status;
  dynamic tempsRepone,observation;
  List<dynamic>?affectations,interventions;

  Intervention();

  Intervention.fromJson({required Map<String,dynamic>donnee}){
    journalId = donnee["journalId"];
    clientId = donnee["clientId"];
    copieurId = donnee["copieurId"];
    userId = donnee["userId"];
    dateAppel = donnee["dateAppel"];
    dateEntrer = donnee["dateEntrer"];
    dateModification = donnee["dateModification"];
    motifAppel = donnee["motifAppel"];
    status = donnee["status"];
    tempsRepone = donnee["tempsRepone"];
    observation = donnee["observation"];
    affectations = donnee["affectations"];
    interventions = donnee["interventions"];
  }

}
