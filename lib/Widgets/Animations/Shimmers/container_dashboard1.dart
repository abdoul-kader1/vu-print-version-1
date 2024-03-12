import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../utils/constantes/couleurs.dart';

class ContainerDashboardShimmer1 extends StatelessWidget {
  final double largeur;
  const ContainerDashboardShimmer1({super.key,required this.largeur});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: VuPrintColors.couleurGrise.withOpacity(0.4),
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: MediaQuery.of(context).size.width * largeur,
          padding: const EdgeInsets.symmetric(vertical: 15),
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red.shade50
            ),
        )
    );
  }
}
