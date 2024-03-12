import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Controllers/Interventions/demande_intervention_c.dart';
import 'Controllers/Interventions/installation_machine_c.dart';
import 'Controllers/Interventions/logs_c.dart';
import 'Controllers/page_accueil_ou_mdp_controller.dart';
import 'Data/Repository/nombre_demande_intervention_r.dart';
import 'Vues/my_app.dart';

final userIsConnect = ChangeNotifierProvider((ref) => PageAccueilOuMdpController());

final nombreDemandesIntervention = StreamProvider((ref) => Stream.periodic(
    const Duration(seconds: 5),(valeur)async=>await NombreDemandeInterventionRepository().getNombreDemandeIntervention()
));

final nombreInterventionEffectuer = StreamProvider((ref) => Stream.periodic(
    const Duration(seconds: 5),(valeur)async=>await NombreDemandeInterventionRepository().getNombreInterventionEffectuer()
));

final nombreMesIntervention = StreamProvider((ref) => Stream.periodic(
    const Duration(seconds: 5),(valeur)async=>await NombreDemandeInterventionRepository().getNombreMesInterventions()
));

final listDemnadeIntervention = ChangeNotifierProvider((ref) => DemandeInterventionController());

final listeLog = ChangeNotifierProvider((ref) => LogController());
final installationMachine = ChangeNotifierProvider((ref) => InstallationMachineController());

void main() {
  runApp(
    const ProviderScope(
        child: MyApp()
    )
  );
}