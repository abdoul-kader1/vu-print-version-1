import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vu_print/Widgets/ChampsSaisie/mon_texte.dart';
import 'package:vu_print/main.dart';
import 'package:vu_print/utils/helper/fonctions.dart';
import '../../../Widgets/others/container_liste.dart';
import '../../../utils/constantes/couleurs.dart';

class NouvelleIntervention extends StatelessWidget {
  const NouvelleIntervention({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context,ref,child){
      final donnee = ref.watch(listDemnadeIntervention).mesInterventions;
      final intervention = donnee.where((element) => element.affectations![0]["status"]=="WAITING").toList();
      return (intervention.isEmpty)?Center(child: MonTexte("Aucune intervention acceptée")):RefreshIndicator(
        onRefresh: ()async{ref.read(listDemnadeIntervention).updateMesInterventions();},
        child: ListView.builder(
            itemCount: intervention.length,
            itemBuilder: (context,index){
              final mesinterventions = intervention[index];
              final date = VuPrintFonction.coupeDate(mesinterventions.dateAppel!);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                child: Column(
                  children: [
                    Slidable(
                        key: ValueKey(index),
                        endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                //autoClose:false,
                                onPressed: (ctx){
                                  ref.read(listDemnadeIntervention).prendreEnChargeIntervention(mesinterventions.journalId!);
                                },
                                backgroundColor: VuPrintColors.couleurBouttonAjouter.withOpacity(0.8),
                                foregroundColor: Colors.white,
                                icon: FontAwesomeIcons.circleCheck,
                                label: 'Prendre en charge',
                                borderRadius: BorderRadius.circular(05),
                              ),
                            ]
                        ),
                        child: ContainerListe(titre: mesinterventions.motifAppel!,sousTitre: mesinterventions.affectations![0]["status"],date: date)
                    ),const SizedBox(height: 0)
                  ],
                ),
              );
            }
        ),
      );
    });
  }
}
