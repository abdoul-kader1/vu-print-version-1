import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vu_print/utils/api/configuration.dart';

import '../exception/erreur.dart';
class VuPrintRequetes{
  VuPrintRequetes._();

  //ajouter une donnée dans BDD
  static Future<Map<String, dynamic>>create(String endPoint,Map<String,dynamic>donnee)async{
    Uri url = Uri.parse("${VuPrintApi.adresseUrl}$endPoint");
    final envoieRequetes = await http.post(
        url,
        body: jsonEncode(donnee),
        headers: {'Content-Type':'application/json'});
    return reponse(envoieRequetes);
  }
  //lire des données dans la BDD
  static Future<Map<String,dynamic>>read(String endPoint)async{
    Uri url = Uri.parse("${VuPrintApi.adresseUrl}$endPoint");
    final envoieRequetes = await http.get(url);
    return reponse(envoieRequetes);
  }
  //mettre a jour les informations de la BDD
  static Future<Map<String,dynamic>>update(String endPoint,Map<String,dynamic>donnee)async{
    Uri url = Uri.parse("${VuPrintApi.adresseUrl}$endPoint");
    final envoieRequete = await http.put(
        url,
        body: jsonEncode(donnee),
        headers: {"Content-Type":"application/json"}
    );
    return reponse(envoieRequete);
  }
  //supprimer un element dans la BDD
  static Future<Map<String,dynamic>>delete(String endPoint)async{
    Uri url = Uri.parse("${VuPrintApi.adresseUrl}$endPoint");
    final envoieRequete = await http.delete(url);
    return reponse(envoieRequete);
  }

  static Map<String, dynamic> reponse(http.Response response){
    if(response.statusCode == 201 || response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      final resultat = jsonDecode(response.body);
      final erreur = resultat["message"];
      //throw Exception("$erreur");
      throw Erreur("Erreur : $erreur");
    }
  }
}