import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vu_print/Controllers/mode_manuel_c.dart';
import 'package:vu_print/Widgets/Bouttons/boutton_rectangle.dart';
import 'package:vu_print/Widgets/ChampsSaisie/input.dart';
import 'package:vu_print/Widgets/ChampsSaisie/mon_texte.dart';
import 'package:vu_print/Widgets/others/menu_selection.dart';
import 'package:vu_print/utils/constantes/couleurs.dart';
import 'package:vu_print/utils/helper/fonctions.dart';
import 'package:vu_print/utils/validator/connexion.dart';
import '../../Data/Repository/intervention_accepter_r.dart';
import '../../Widgets/others/box_info_machine_installation.dart';
import '../../main.dart';

class InstallationMachine extends StatefulWidget {

  final int idCopieur;

  const InstallationMachine({super.key,required this.idCopieur});

  @override
  State<InstallationMachine> createState() => _InstallationMachineState();
}

class _InstallationMachineState extends State<InstallationMachine> {

  DateTime date = DateTime.now();

  int groupValue = 1;
  String compositionMachineChoisir = "";
  String configurationMachineChoisir = "";
  String configurationCompteurChoisir = "";
  String volumeMensuel = "";

  Map<String,bool>compositionMachine = {
    "Chargeur R / V" : false,
    "Socle" : false,
    "Cassettes" : false,
  };

  Map<String,bool>configurationMachine = {
    "Copie": false,
    "Impression": false,
    "Scan": false,
    "Fax": false,
  };

  Map<String,int> configurationCompteur = {
    "Monochrone":1,
    "Quadrichrone":2
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //iconTheme: IconThemeData(color: Colors.greenAccent),
          title:MonTexte("Installation des machines",couleur: Colors.white),
          backgroundColor: VuPrintColors.couleurPrincipale,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Form(
          key: ModeManuelleController.keyFormulaireInstallationMachine,
          child: Column(
            children: [
              //listes des clients
              Consumer(builder: (ctx,ref,child){
                final donnee = ref.watch(installationMachine);
                return (donnee.clients.isEmpty)?MonTexte("Chargement des clients"):SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: MenuSelection(clients: donnee.clients, valeurIntiale: donnee.idClientInitial,ref: ref),
                );
              }),const SizedBox(height: 10),
              // nombre de copie blanc noir et couleur
              Input(controller:ModeManuelleController.nombreCopieBlancNoire,validator:VuPrintValidator.verifieChampsNombreCopieBlancNoire,titre: "Nombre de copie blanc / noire", masquerSaisie: false, couleurBordure: VuPrintColors.couleurPrincipale,textInputType: TextInputType.number,couleurPlaceholder: Colors.grey),const SizedBox(height: 10),
              Input(controller:ModeManuelleController.nombreCopieCouleur,validator:VuPrintValidator.verifieChampsNombreCopieCouleur,titre: "Nombre de copie couleur", masquerSaisie: false, couleurBordure: VuPrintColors.couleurPrincipale,textInputType: TextInputType.number,couleurPlaceholder: Colors.grey),const SizedBox(height: 10),
              const BoxInfoMachineInstallation(titre: 'La composition des installations'),const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: buildCompositionInstallation(),
                ),
              ),const SizedBox(height: 10),
              Input(controller:ModeManuelleController.nombreCassettes,validator:VuPrintValidator.verifieChampsNombreCassettes,titre: "Nombres de cassettes", masquerSaisie: false, couleurBordure: VuPrintColors.couleurPrincipale,textInputType: TextInputType.number,couleurPlaceholder: Colors.grey),const SizedBox(height: 10),
              const BoxInfoMachineInstallation(titre: 'La configuration de la machine'),const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: buildConfigurationMachine(),
                ),
              ),
              InkWell(
                onTap: (){
                  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2090)).then(
                          (value) => setState((){
                        date = value!;
                      })
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: VuPrintColors.couleurGrise,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: AlignmentDirectional.center,
                        width: MediaQuery.of(context).size.width*0.3,height: 50,color: VuPrintColors.couleurPrincipale,
                        child: MonTexte("Date d'installation",couleur: Colors.white),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        width: MediaQuery.of(context).size.width*0.6,height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MonTexte(VuPrintFonction.formateurDate(date)),const Icon(Icons.calendar_month_outlined,color: VuPrintColors.couleurPrincipale)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),const SizedBox(height: 10),
              Input(controller:ModeManuelleController.observation,validator:VuPrintValidator.verifieChampsObservation,minLine:1,maxLine:10,titre: "Observation", masquerSaisie: false, couleurBordure: VuPrintColors.couleurPrincipale,couleurPlaceholder: Colors.grey),
              const SizedBox(height: 10),
              const BoxInfoMachineInstallation(titre: 'configuration du compteur'),const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildConfigurationCompteur(),
              ),
              //const Input(titre: "la valeur (exemple : 13,1355)", masquerSaisie: false, couleurBordure: VuPrintColors.couleurPrincipale,textInputType: TextInputType.number,couleurPlaceholder: Colors.grey),const SizedBox(height: 10),
              const SizedBox(height: 10),
              Consumer(builder: (ctx,ref,child){
                final donnee = ref.watch(installationMachine).idClientInitial;
                return BouttonRectangle(
                    onPressed: ()async{
                      if(ModeManuelleController.keyFormulaireInstallationMachine.currentState!.validate()){
                        selectOrNoCompositionInstallation();selectOrNoConfigurationMachine();volumeMensuels();
                          if(compositionMachineChoisir=="" || configurationMachineChoisir ==""){
                            if(context.mounted)ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: MonTexte("selectionner au moins une composition et une configuraion machine")));
                        }else{
                            try{
                              final couper = compositionMachineChoisir.substring(0,compositionMachineChoisir.length-2);
                              final couper1 = configurationMachineChoisir.substring(0,configurationMachineChoisir.length-2);
                              await InterventionAccepterRepository().faireInstallationMachine(
                                  idCopieur: widget.idCopieur,idClients: donnee, objet: groupValue.toString(),
                                  composition: couper, nombreCassette:int.parse(ModeManuelleController.nombreCassettes.text),
                                  fonctions: couper1, volumeMensuel: volumeMensuel, observation: ModeManuelleController.observation.text,
                                  dateInstallation: VuPrintFonction.formateurDate(date)
                              );
                            }catch(erreur){
                              final couper = compositionMachineChoisir.substring(0,compositionMachineChoisir.length-2);
                              final couper1 = configurationMachineChoisir.substring(0,configurationMachineChoisir.length-2);
                              print(
                                  "composition : $couper\nfonctions : $couper1\nobjet :$groupValue\nvolume mensuel : $volumeMensuel\ndate installation : ${VuPrintFonction.formateurDate(date)}"
                              );
                              if(context.mounted)ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: MonTexte("$erreur")));
                            }
                          }
                      }
                    },
                    texte: "Valider",bgCouleur: VuPrintColors.couleurBouttonValider,texteCouleur: Colors.white
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
  buildCompositionInstallation(){
    List<Widget>row = [];
    compositionMachine.forEach((key, value) {
      row.addAll([
        Checkbox(
          value: compositionMachine[key],
          onChanged: (valeur){
            setState(() {
              compositionMachineChoisir = "";
              compositionMachine[key] = valeur!;
            });
          },
          side: const BorderSide(color: VuPrintColors.couleurPrincipale),
        ),
        MonTexte(key,couleur: VuPrintColors.couleurPrincipale),
      ]);
    });
    return row;
  }
  selectOrNoCompositionInstallation(){
    compositionMachine.forEach((key, value) {
      if(compositionMachine[key] == true && !compositionMachineChoisir.contains(key)){
        setState(() {
          compositionMachineChoisir += "$key - ";
        });
      }
    });
  }
  buildConfigurationMachine(){
    List<Widget>row = [];
    configurationMachine.forEach((key, value) {
      row.addAll([
        Checkbox(
          value: configurationMachine[key],
          onChanged: (valeur){
            setState(() {
              configurationMachineChoisir = "";
              configurationMachine[key] = valeur!;
            });
          },
          side: const BorderSide(color: VuPrintColors.couleurPrincipale),
        ),
        MonTexte(key,couleur: VuPrintColors.couleurPrincipale),
      ]);
    });
    return row;
  }
  selectOrNoConfigurationMachine(){
    configurationMachine.forEach((key, value) {
      if(configurationMachine[key] == true && !configurationMachineChoisir.contains(key)){
        setState(() {
          configurationMachineChoisir += "$key - ";
        });
      }
    });
  }
  buildConfigurationCompteur(){
    List<Widget>row = [];
    configurationCompteur.forEach((key, value) {
      row.addAll([
        Radio(
            value: configurationCompteur[key], groupValue: groupValue,
            onChanged: (valeur){
              setState(() {
                groupValue = valeur!;
              });
            }
        ),
        MonTexte(key,couleur: VuPrintColors.couleurPrincipale),
      ]);
    });
    return row;
  }
  volumeMensuels(){
    final couleur = "${ModeManuelleController.nombreCopieCouleur.text} Couleur | ";
    final blancNoire = "${ModeManuelleController.nombreCopieBlancNoire.text} Noir Blanc";
    volumeMensuel = couleur + blancNoire;
    setState(() {});
  }

}
