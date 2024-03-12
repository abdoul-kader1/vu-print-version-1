class Copieur {
  int?copieurId,userId,magasinId;
  String?model,constructeur,noSerie,colorimetrie,nbreCompteur;
  int?coutTotal;
  String?dateAchat,stokage,imageLien,observation,dateEntrer,dateModification,status;
  List<dynamic>?installations;

  Copieur();

  Copieur.fromJson({required Map<String,dynamic>donnee}){
    copieurId = donnee["copieurId"];
    userId = donnee["userId"];
    magasinId = donnee["magasinId"];
    model = donnee["model"];
    constructeur = donnee["constructeur"];
    noSerie = donnee["noSerie"];
    colorimetrie = donnee["colorimetrie"];
    nbreCompteur = donnee["nbreCompteur"];
    coutTotal = donnee["coutTotal"];
    dateAchat = donnee["dateAchat"];
    stokage = donnee["stokage"];
    imageLien = donnee["imageLien"];
    observation = donnee["observation"];
    dateEntrer = donnee["dateEntrer"];
    dateModification = donnee["dateModification"];
    status = donnee["status"];
    installations = donnee["installations"];
  }
}
