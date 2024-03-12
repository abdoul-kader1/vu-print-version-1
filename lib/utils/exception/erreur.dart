class Erreur implements Exception{

  final String?message;
  Erreur([this.message]);

  @override
  String toString()=>message??"Erreur";
}