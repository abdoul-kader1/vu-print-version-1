import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vu_print/Widgets/ChampsSaisie/mon_texte.dart';
import 'package:vu_print/Widgets/others/barre_recherche.dart';
import 'package:vu_print/main.dart';
import 'package:vu_print/utils/constantes/couleurs.dart';
import 'package:vu_print/utils/helper/fonctions.dart';
import '../../../Widgets/others/container_liste.dart';

class DemandeInterventions extends StatelessWidget {

  const DemandeInterventions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: MonTexte("Demande d'intervention"),backgroundColor: VuPrintColors.couleurPrincipale),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverList.list(children:  [
                  Consumer(builder: (context,ref,child){
                    return BarreRecherche(
                        onChange: ref.read(listDemnadeIntervention).barreRecheche
                    );
                  })
                ])
              ];
            }, body: Consumer(
              builder: (context,ref,child){
                final list = ref.watch(listDemnadeIntervention).allDemandeIntervention;
                final intervention = list.where((element) => element.status=="WAITING").toList();
                if(intervention.isEmpty){
                  return Center(child: MonTexte("Aucune liste"));
                }else{
                  return RefreshIndicator(
                      onRefresh: ()async{
                        ref.read(listDemnadeIntervention).updateListInterventions();
                      },
                child: ListView.builder(
                      itemCount: intervention.length,
                      itemBuilder: (context,index){
                        final donnee = intervention[index];
                        final date = VuPrintFonction.coupeDate(donnee.dateAppel!);
                        return Column(
                          children: [
                            Slidable(
                                key: ValueKey(index),
                                endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (ctx){
                                          ref.read(listDemnadeIntervention).assignerIntervention(donnee.journalId!);
                                          Navigator.pop(context);
                                        },
                                        backgroundColor: VuPrintColors.couleurBouttonAjouter.withOpacity(0.8),
                                        foregroundColor: Colors.white,
                                        icon: FontAwesomeIcons.circleCheck,
                                        label: 'Accepter',
                                        borderRadius: BorderRadius.circular(05),
                                      ),
                                    ]
                                ),
                                child: ContainerListe(titre:donnee.motifAppel!,sousTitre: donnee.status!,date: date)
                            ),const SizedBox(height: 10)
                          ],
                        );
                      }
                  ));
                }
              }),
        ),
      )
    );
  }
}
