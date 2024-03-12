import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vu_print/Controllers/home_page_c.dart';
import 'package:vu_print/utils/constantes/images.dart';
import 'package:vu_print/utils/helper/fonctions.dart';
import '../../Widgets/Animations/Shimmers/container_dashboard1.dart';
import '../../Widgets/ChampsSaisie/mon_texte.dart';
import '../../Widgets/TableauDeBord/container_dashboard.dart';
import '../../Widgets/container_log.dart';
import '../../main.dart';
import '../../utils/constantes/couleurs.dart';
import 'DemandeInterventions/demande_intervention.dart';

final nbrDemandesIntervention = FutureProvider((ref) => ref.watch(nombreDemandesIntervention).value!.then((value) => value));
final nbrMesInterventions = FutureProvider((ref) => ref.watch(nombreMesIntervention).value!.then((value) => value));
final nbrInterventionsEffectuer = FutureProvider((ref) => ref.watch(nombreInterventionEffectuer).value!.then((value) => value));
final controller = ChangeNotifierProvider((ref) => HomePageController());

class AcceuilScreen extends StatefulWidget {
  const AcceuilScreen({super.key});

  @override
  State<AcceuilScreen> createState() => _AcceuilScreenState();
}

class _AcceuilScreenState extends State<AcceuilScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: NestedScrollView(
          headerSliverBuilder: (context,valeur){
            return [
              SliverList.list(children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer(builder: (context,ref,child){
                          final donnee = ref.watch(nbrDemandesIntervention);
                          if(donnee.hasValue){
                            return InkWell(
                              onTap: (){
                                ref.read(listDemnadeIntervention).updateListInterventions();
                                VuPrintFonction.chancePage(context, (ctx) =>const DemandeInterventions());
                                },
                              child: ContainerDashboard(icone:VuPrintImages.interventionReuissi,couleurArrierePlan:VuPrintColors.couleurMotDePasseOublie,titre: "Demandes\nd'interventions", nombre: donnee.value!, largeur: MediaQuery.of(context).size.width*0.45),
                            );
                          }else{
                            return const ContainerDashboardShimmer1(largeur: 0.45);
                          }
                        }),
                        Consumer(builder: (context,ref,child){
                          final donnee = ref.watch(nbrMesInterventions);
                          if(donnee.hasValue){
                            return InkWell(
                              onTap: (){ref.read(controller).changePageBoutton(1);},
                              child: ContainerDashboard(icone:VuPrintImages.imprimanteInstaller,couleurArrierePlan:VuPrintColors.couleurMotDePasseOublie,titre: 'Mes\ninterventions', nombre: donnee.value!, largeur: MediaQuery.of(context).size.width*0.45)
                            );
                          }else{
                            return const ContainerDashboardShimmer1(largeur: 0.45);
                          }
                        })
                      ],
                    ),const SizedBox(height: 15),
                    Consumer(builder: (context,ref,child){
                      final donnee = ref.watch(nbrInterventionsEffectuer);
                      if(donnee.hasValue){
                        return InkWell(
                          //onTap: (){VuPrintFonction.chancePage(context, (ctx) =>const DemandeInterventions());},
                            child: ContainerDashboard(icone:VuPrintImages.interventionNonResolu,couleurArrierePlan:VuPrintColors.couleurBouttonValider,titre: 'Intervention effectuées', nombre: donnee.value!, largeur:MediaQuery.of(context).size.width),
                        );
                      }else{
                        return const ContainerDashboardShimmer1(largeur: 1);
                      }
                    }),
                    const SizedBox(height: 30)
                  ],
                )
              ])
            ];
          },
          body: Consumer(
            builder: (context,ref,child) {
              final donnee = ref.watch(listeLog).listesLog;
              if(donnee.isEmpty){
                return Center(child: MonTexte("Aucune liste"));
              }else{
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.00, -3.00),
                        end: Alignment(0, 1),
                        colors: [Color(0xFF0661CB),Color(0x009FCBFE)],
                      ),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(19),topLeft:Radius.circular(19))
                  ),
                  child: RefreshIndicator(
                    onRefresh: () async{ref.read(listeLog).getListLog();},
                    child: ListView.builder(
                        itemCount: donnee.length,
                        itemBuilder: (context,index){
                          final log = donnee[index];
                          final date = VuPrintFonction.coupeDate(log.dateAppel!);
                          return Column(
                            children: [
                              (index==0)?MonTexte("Journal des activités",poids: FontWeight.bold):Container(),
                              (index==0)?const SizedBox(height: 20):Container(),
                              ContainerLog(
                                nomClient: VuPrintFonction.convertirUtf8(log.client!),
                                modeleCopieur:log.copieur!,
                                sousTitre: (log.techniciens!.isEmpty)?"Aucun technicien":VuPrintFonction.convertirUtf8(log.techniciens![0]["user"]["firstname"]),
                                date: date,
                                status: log.status!,
                              ),const SizedBox(height: 10),
                              (index==donnee.length-1)?const SizedBox(height: 100):Container()
                            ],
                          );
                        }
                    ),
                  ),
                );
              }
            },
          )
      ),
    );
  }
}
