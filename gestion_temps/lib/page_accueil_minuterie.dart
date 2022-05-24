// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:gestion_temps/main.dart';
import 'widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'minuteur.dart';

class PageAccueilMinuterie extends StatelessWidget {
  const PageAccueilMinuterie({Key? key}) : super(key: key);

  int aRemplacer() {
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    Minuteur minuteur = new Minuteur();
    minuteur.demarrerTravail();
    return Scaffold(
        appBar: AppBar(title: Text('Ma gestion du temps')),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints contraints) {
          final double largeurDisponible = contraints.maxWidth;
          return Column(children: [
            Row(children: [
              Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
              Expanded(
                  child: BoutonGenerique(
                      couleur: Colors.red,
                      texte: 'Travail',
                      taille: 45,
                      action: aRemplacer)),
              Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
              Expanded(
                  child: BoutonGenerique(
                      couleur: Colors.green,
                      texte: 'Mini pause',
                      taille: 45,
                      action: aRemplacer)),
              Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
              Expanded(
                  child: BoutonGenerique(
                      couleur: Colors.greenAccent,
                      texte: 'Maxi pause',
                      taille: 45,
                      action: aRemplacer)),
              Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT))
            ]),
            Expanded(
              child: StreamBuilder(
                  initialData: ModeleMinuteur('00:00', 1),
                  stream: minuteur.stream(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    ModeleMinuteur minuteur = snapshot.data;
                    return Container(
                        child: CircularPercentIndicator(
                      radius: largeurDisponible / 4,
                      lineWidth: 10.0,
                      // ignore: unnecessary_null_comparison
                      percent: (minuteur.pourcentage == null)
                          ? 1
                          : minuteur.pourcentage,
                      center: Text(
                        (minuteur.temps == null) ? '00:00' : minuteur.temps,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      progressColor: Colors.green,
                    ));
                  }),
            ),
          ]);
        }),
        bottomNavigationBar: Row(
          children: [
            Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
            Expanded(
                child: BoutonGenerique(
                    couleur: Colors.teal,
                    texte: 'Travail',
                    taille: 45,
                    action: aRemplacer)),
            Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
            Expanded(
                child: BoutonGenerique(
                    couleur: Colors.grey,
                    texte: 'Mini pause',
                    taille: 45,
                    action: aRemplacer)),
            Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT))
          ],
        ));
  }
}
