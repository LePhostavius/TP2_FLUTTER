// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:gestion_temps/main.dart';
import 'widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PageAccueilMinuterie extends StatelessWidget {
  const PageAccueilMinuterie({Key? key}) : super(key: key);
  int aRemplacer() {
    return 1;
  }

  @override
  Widget build(BuildContext context) {
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
              child: CircularPercentIndicator(
                radius: largeurDisponible / 3,
                lineWidth: 10.0,
                percent: 1,
                center: Text(
                  '30:00',
                  style: Theme.of(context).textTheme.headline4,
                ),
                progressColor: Colors.deepPurpleAccent,
              ),
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
