class Technicien {
  int?technicienId;
  String?technicienQualification;
  String?technicienSpecialite;
  String?moyenDeplacement;
  String?technicienStatus;
  String?zoneIntervention;
  String?dateEntrer;
  dynamic dateModification;
  String?status;
  User?user;

  Technicien();

  Technicien.fromJson({required Map<String,dynamic>donnee}){
    technicienId = donnee["technicienId"];
    technicienQualification = donnee["technicienQualification"];
    technicienSpecialite = donnee["technicienSpecialite"];
    moyenDeplacement = donnee["moyenDeplacement"];
    technicienStatus = donnee["technicienStatus"];
    zoneIntervention = donnee["zoneIntervention"];
    dateEntrer = donnee["dateEntrer"];
    dateModification = donnee["dateModification"];
    status = donnee["status"];
    user = User.fromJson(donnee: donnee["user"]);
  }
}

Map<String,dynamic>toJson()=>{

};

class User {
  int?userId;
  String?lastname;
  String?firstname;
  String?gender;
  String?civility;
  String?email;
  String?mobile;
  String?createdOn;
  dynamic updatedOn;
  String?status;
  Role?role;
  List<dynamic>?offices;

  User();

  User.fromJson({required Map<String,dynamic>donnee}){
    userId = donnee["userId"];
    lastname = donnee["lastname"];
    firstname = donnee["firstname"];
    firstname = donnee["firstname"];
    gender = donnee["gender"];
    civility = donnee["civility"];
    email = donnee["email"];
    mobile = donnee["mobile"];
    createdOn = donnee["createdOn"];
    status = donnee["status"];
    role = Role.fromJson(donnee:donnee["role"]);
    offices = donnee["offices"];
  }

}

class Role {
  int?roleId;
  String?roleName;
  String?roleLevel;

  Role();

  Role.fromJson({required Map<String,dynamic>donnee}){
    roleId = donnee["roleId"];
    roleName = donnee["roleName"];
    roleLevel = donnee["roleLevel"];
  }

}

