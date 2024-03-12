import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';
import 'connexion/connexion_screen.dart';
import 'home_page.dart';

class PageAccueilOuMpd extends ConsumerWidget {

  const PageAccueilOuMpd({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final userIsConnecting = ref.watch(userIsConnect);
    if(userIsConnecting.userIsConnect == null){
      return const Scaffold(
        body: Center(child:CircularProgressIndicator()),
      );
    }else{
      return userIsConnecting.userIsConnect!?const MyHomePage():const ConnexionScreen();
    }
  }
}
