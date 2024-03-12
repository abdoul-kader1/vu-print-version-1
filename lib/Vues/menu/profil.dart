import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vu_print/Controllers/profil_c.dart';
import 'package:vu_print/Widgets/Bouttons/boutton_rectangle.dart';
import 'package:vu_print/Widgets/ChampsSaisie/input.dart';
import 'package:vu_print/Widgets/ChampsSaisie/mon_texte.dart';
import '../../Widgets/others/liste_element_profile.dart';
import '../../main.dart';
import '../../utils/constantes/couleurs.dart';
import '../../utils/helper/fonctions.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List kader = ["Modifier vos informations","Se deconnecter"];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(width: width,height: 166,color: VuPrintColors.couleurMotDePasseOublie),
                Padding(
                  padding : const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      //image du technicien
                      const CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundImage: NetworkImage("https://images.pexels.com/photos/943235/pexels-photo-943235.jpeg?auto=compress&cs=tinysrgb&w=600"),
                        ),
                      ),const SizedBox(height: 10),
                      Consumer(builder: (context,ref,child){
                        final user1 = ref.watch(userIsConnect).technicien;
                        return Column(
                          children: [
                            MonTexte("${user1.user!.firstname!} ${user1.user!.lastname!}",couleur: Theme.of(context).colorScheme.onBackground,poids: FontWeight.w600,taille: 19),const SizedBox(height: 2),
                            MonTexte(user1.technicienSpecialite!,couleur: Theme.of(context).colorScheme.onBackground,poids: FontWeight.w300,),const SizedBox(height: 2),
                            MonTexte("Moyen deplacement : ${user1.moyenDeplacement}",couleur: Theme.of(context).colorScheme.onBackground,poids: FontWeight.w300,),const SizedBox(height: 20),
                          ],
                        );
                      })
                    ],
                  ),
                )
              ],
            ),
            for(var i = 0;i<kader.length;i++)...[
              InkWell(
                onTap: (){
                  if(i==0){
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled:true,
                        builder: (ctx){
                          return AnimatedContainer(
                            duration: const Duration(seconds: 1),
                              width: width,height: View.of(context).viewInsets.bottom == 0 ?height*0.45:height*0.8,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                                  color: VuPrintFonction.isModeSombre(context)?Theme.of(context).colorScheme.surface:Colors.white
                              ),
                            child: Consumer(builder: (context,ref,child) {
                              final donnee = ref.watch(userIsConnect).technicien;
                              return SingleChildScrollView(
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: width*0.8,
                                      child: Input(
                                        titre: "${donnee.user!.firstname} ${donnee.user!.lastname} ", masquerSaisie: false, couleurBordure: VuPrintColors.couleurMotDePasseOublie, prefixIcons: FontAwesomeIcons.user,
                                        controller: ProfilController.nom,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: width*0.8,
                                      child: Input(controller:ProfilController.moyenDeplacement,titre: donnee.moyenDeplacement!, masquerSaisie: false, couleurBordure: VuPrintColors.couleurMotDePasseOublie, prefixIcons: FontAwesomeIcons.user),
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: width*0.8,
                                      child: Input(controller:ProfilController.number,titre: donnee.user!.mobile!, masquerSaisie: false, couleurBordure: VuPrintColors.couleurMotDePasseOublie, prefixIcons: FontAwesomeIcons.user),
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                      width: width*0.8,
                                      child: Input(controller:ProfilController.zoneIntervention,titre: donnee.zoneIntervention!, masquerSaisie: false, couleurBordure: VuPrintColors.couleurMotDePasseOublie, prefixIcons: FontAwesomeIcons.user),
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                        width: width*0.8,
                                        child: BouttonRectangle(
                                            onPressed: ()=>ProfilController.validation(ref, donnee, context, ctx),
                                            texte:"Modifier",bgCouleur: VuPrintColors.couleurMotDePasseOublie,
                                            texteCouleur: Colors.white
                                        )
                                    ),
                                  ],
                                ),
                              );
                            }),
                          );
                        }
                    );
                  }else if(i==1){
                    showDialog(
                        context: context,
                        builder: (ctx){
                          return PopScope(
                            canPop: false,
                            child: AlertDialog(
                              title: MonTexte("Se deconnecter"),
                              content: MonTexte("Etes-vous sur de vouloir quitter ?"),
                              actions: [
                                Consumer(
                                    builder: (ctx,ref,child){
                                      return ElevatedButton(onPressed: (){
                                        ref.read(userIsConnect).deconnecter();
                                        Navigator.pop(ctx);
                                        Navigator.pop(context);
                                      }, child: MonTexte("Oui"));
                                    }
                                ),
                                ElevatedButton(onPressed: (){Navigator.pop(ctx);}, child: MonTexte("Non")),
                              ],
                            ),
                          );
                        }
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListeElementProfile(titre: kader[i]),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}