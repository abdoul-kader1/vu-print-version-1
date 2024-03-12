import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vu_print/main.dart';
import '../../Modeles/clients.dart';
import '../../utils/constantes/couleurs.dart';
import '../ChampsSaisie/mon_texte.dart';

class MenuSelection extends StatelessWidget {

  final List<Clients> clients;final int valeurIntiale;
  final WidgetRef ref;
  const MenuSelection({super.key,required this.clients,required this.valeurIntiale,required this.ref});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: valeurIntiale,
      items: clients.map(
              (e) => DropdownMenuItem<int>(value:e.clientId,child: MonTexte(e.clientNom!))
      ).toList(),
      onChanged: ref.read(installationMachine).changeValeurInitiale,
      decoration: InputDecoration(
          isDense : true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: VuPrintColors.couleurPrincipale)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: VuPrintColors.couleurPrincipale)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: VuPrintColors.couleurPrincipale)
          )
      ),
    );
  }
}
