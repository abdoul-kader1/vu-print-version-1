class VuPrintValidator{

  VuPrintValidator._();

  static String?verifieChampsEmail(String?valeur){
    if(valeur == null || valeur.isEmpty){
      return "l'email est vide";
    }else{
      return null;
    }
  }
  static String?verifieChampsMdp(String?valeur){
    if(valeur!.isNotEmpty){
      if(valeur.length<=5){
        return "le mot de passe est top court";
      }else{
        return null;
      }
    }else{
      return "le mot de passe est vide";
    }
  }
  static String?verifieChampsNumerosSerie(String?valeur){
    if(valeur == null || valeur.isEmpty){
      return "Entrez un numéros de serie";
    }else{
      return null;
    }
  }
  static String?verifieChampsDescriptionDepannage(String?valeur){
    if(valeur == null || valeur.isEmpty){
      return "Entrez une description";
    }else{
      return null;
    }
  }
  static String?verifieChampsNombreCopieBlancNoire(String?valeur){
    if(valeur == null || valeur.isEmpty){
      return "Nombre de copie blanc / noire vide";
    }else{
      return null;
    }
  }
  static String?verifieChampsNombreCopieCouleur(String?valeur){
    if(valeur == null || valeur.isEmpty){
      return "Nombre de copie couleur vide";
    }else{
      return null;
    }
  }
  static String?verifieChampsNombreCassettes(String?valeur){
    if(valeur == null || valeur.isEmpty){
      return "Nombre de cassette vide";
    }else{
      return null;
    }
  }
  static String?verifieChampsObservation(String?valeur){
    if(valeur == null || valeur.isEmpty){
      return "Veuillez remplir le champs observation";
    }else{
      return null;
    }
  }
}