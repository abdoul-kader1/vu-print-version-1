import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vu_print/Controllers/home_page_c.dart';
import 'package:vu_print/Modeles/technicien.dart';
import 'package:vu_print/Widgets/ChampsSaisie/mon_texte.dart';
import 'package:vu_print/utils/helper/fonctions.dart';
import '../Data/Repository/profil_r.dart';
import '../Widgets/Animations/Lotties/erreur500.dart';
import '../main.dart';
import '../utils/constantes/couleurs.dart';
import 'menu/acceuil.dart';
import 'menu/choix_installation.dart';
import 'menu/intervention.dart';
import 'menu/liste_intervention_effectuer.dart';
import 'menu/profil.dart';

final getUser = FutureProvider((ref)async{
  SharedPreferences userId = await SharedPreferences.getInstance();
  final id = userId.getInt("userId");
  Technicien technicien= await ProfilRepository.getTechnicien(id!);
  ref.read(userIsConnect).updateTechnical(technicien);
});

final controller = ChangeNotifierProvider((ref) => HomePageController());

class MyHomePage extends ConsumerStatefulWidget {

  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return ref.watch(getUser).when(
        data: (data){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: MonTexte("Acceuil"),
              actions: [
                IconButton(onPressed: (){VuPrintFonction.chancePage(context,(ctx)=>const Profile());}, icon: const Icon(FontAwesomeIcons.gear))
              ],
            ),
            body: Stack(
              alignment: Alignment.center,
              children: [
                //affichage des ecrans principaux de l'application
                PageView(
                  controller: HomePageController.pageController,
                  onPageChanged: ref.read(controller).changePageScroll,
                  children: const [AcceuilScreen(),Intervention(),ListeInterventionEffectuer()],
                ),
                //afficher de la tab des menus
                Positioned(
                    bottom: 0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        //le container flou
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width*0.95,
                              height: 75,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.6, height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: VuPrintColors.couleurPrincipale
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed:(){ref.read(controller).changePageBoutton(0);},
                                      icon: Icon(FontAwesomeIcons.house,size: 25,color: (ref.watch(controller).initialePage==0)?Colors.white:Colors.grey,)),const SizedBox(width: 25),
                                  IconButton(
                                      onPressed:(){ref.read(controller).changePageBoutton(1);},
                                      icon: Icon(FontAwesomeIcons.screwdriverWrench,size: 25,color: (ref.watch(controller).initialePage==1)?Colors.white:Colors.grey)),const Spacer(),
                                  IconButton(
                                      onPressed:(){ref.read(controller).changePageBoutton(2);},
                                      icon: Icon(FontAwesomeIcons.rectangleList,size: 25,color: (ref.watch(controller).initialePage==2)?Colors.white:Colors.grey)),
                                ],
                              ),
                            )
                        )
                      ],
                    )
                ),
                //boutton flottant pour ajouter une nouvelle installation de machine
                Positioned(
                  bottom: 40,
                  right: MediaQuery.of(context).size.width*0.33,
                  child: InkWell(
                    onTap: (){VuPrintFonction.chancePage(context,(ctx)=>const ChoixInstallations());},
                    child: Container(
                      width: 55,height: 55,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: VuPrintColors.couleurBouttonAjouter
                      ),
                      child: const Icon(Icons.add,size: 30,color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          );
        },
        error: (ereur,trace){
          return const Erreur500();
        },
        loading: (){
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
    );
  }
}

/*

 */