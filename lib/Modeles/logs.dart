class Log {
  int?journalId;
  String?client,copieur,dateAppel,motifAppel,dateLog,status;
  List<dynamic>?techniciens;

  Log();

  Log.fromJson({required Map<String,dynamic>donnee}){
    journalId = donnee["journalId"];
    client = donnee["client"];
    copieur = donnee["copieur"];
    dateAppel = donnee["dateAppel"];
    motifAppel = donnee["motifAppel"];
    dateLog = donnee["dateLog"];
    status = donnee["status"];
    techniciens = donnee["techniciens"];
  }

}
