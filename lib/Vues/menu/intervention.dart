import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vu_print/Widgets/ChampsSaisie/mon_texte.dart';
import 'package:vu_print/utils/constantes/images.dart';
import '../../Widgets/others/barre_recherche.dart';
import '../../utils/constantes/couleurs.dart';
import 'Status intervention/intervention_accepter.dart';
import 'Status intervention/nouvellle_intervention.dart';

class Intervention extends StatefulWidget {
  const Intervention({super.key});

  @override
  State<Intervention> createState() => _InterventionState();
}

class _InterventionState extends State<Intervention> with SingleTickerProviderStateMixin{
  late TabController tabController;
  int selectedValue = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BarreRecherche(),const SizedBox(height: 20),afficheTabBar(),afficheTabBarView()
        ],
      ),
    );
  }

  TabBar afficheTabBar(){
    return TabBar(
        controller: tabController,
        //labelColor: Colors.white,
        //unselectedLabelColor: Colors.black,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        onTap: (valeur){
          setState(() {
            selectedValue = valeur;
          });
          tabController.animateTo(valeur);
        },
        tabs: [
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: selectedValue == 0 ? VuPrintColors.couleurBouttonValider: VuPrintColors.couleurBouttonAjouter,
                boxShadow: selectedValue == 0 ? [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(0, 1)
                  )
                ]: null,
                borderRadius: BorderRadius.circular(30)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MonTexte(
                    "Assignée(s)",alignementTexte: TextAlign.center,
                    poids: FontWeight.w900,
                  couleur: Colors.white,
                ),
                SvgPicture.asset(VuPrintImages.add)],
            ),
          ),
          Container(
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: selectedValue == 1 ? VuPrintColors.couleurBouttonValider: VuPrintColors.couleurBouttonAjouter,
                boxShadow: selectedValue == 1 ? [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(0, 1)
                  )
                ]: null,
                borderRadius: BorderRadius.circular(30)
            ),
            child: MonTexte("En cours",alignementTexte: TextAlign.center,poids: FontWeight.w900, couleur: Colors.white),
          )
        ]
    );
  }
  SizedBox afficheTabBarView(){
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.6,
      child: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [NouvelleIntervention(),InterventionAccepter()]
      ),
    );
  }
}
