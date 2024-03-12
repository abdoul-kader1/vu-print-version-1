import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Widgets/ChampsSaisie/mon_texte.dart';
import '../../../main.dart';
import '../../../utils/helper/fonctions.dart';

class InterventionAccepter extends ConsumerWidget {
  const InterventionAccepter({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final donnee = ref.watch(listDemnadeIntervention).listeInterventionAccepter;
    final intervention = donnee.where((element) => element.statusAffectation == "SUPPORTED").toList();
    return (ref.watch(listDemnadeIntervention).isloadingInterventionAccepter)?
      const Center(child: CircularProgressIndicator()):
        (intervention.isEmpty)?
        Center(child: MonTexte(alignementTexte: TextAlign.center,"Aucune intervention prise en charge pour le moment,veuillez patientez...")):
        RefreshIndicator(
      onRefresh: ()async{
        ref.read(listDemnadeIntervention).interventionAccepter();
        ref.read(listDemnadeIntervention).changeLoaderInterventionAccepter();
        },
      child: ListView.builder(
          itemCount: intervention.length,
          itemBuilder: (context,index){
            final mesinterventions = intervention[index];
            final date = VuPrintFonction.coupeDate(mesinterventions.dateAppel);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
              child: Column(
                children: [
                  Container(
                        padding: const EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [MonTexte("client :",poids: FontWeight.bold),MonTexte(VuPrintFonction.convertirUtf8(mesinterventions.nomClient))]),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [MonTexte("Addresse :",poids: FontWeight.bold),MonTexte(mesinterventions.adresseClients)]),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [MonTexte("telephone :",poids: FontWeight.bold),MonTexte(mesinterventions.telephoneClients)]),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [MonTexte("modele :",poids: FontWeight.bold),MonTexte(mesinterventions.modeleCopieur)]),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [MonTexte("constructeur :",poids: FontWeight.bold),MonTexte(mesinterventions.constructeurCopieur)]),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [MonTexte("numeros serie :",poids: FontWeight.bold),MonTexte(mesinterventions.numeroSerieCopieur)]),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [MonTexte("motif d'appel :",poids: FontWeight.bold),MonTexte(VuPrintFonction.convertirUtf8(mesinterventions.modifAppel))]),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [MonTexte("Date appel :",poids: FontWeight.bold),MonTexte(date)]),
                            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [MonTexte("Status :",poids: FontWeight.bold),MonTexte(VuPrintFonction.changeTexteStatusJournalActiviter(mesinterventions.statusAffectation))]),
                          ],
                        ),
                      ),(index==intervention.length-1)?const SizedBox(height: 100):Container()
                ],
              ),
            );
          }
      ),
    );
  }
}
