// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:gestion_temps/main.dart';
import 'widgets.dart';
//import 'package:percent_indicator/percent_indicator.dart';

class PageAccueilMinuterie extends StatelessWidget {
  const PageAccueilMinuterie({Key? key}) : super(key: key);

  void methodevide() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Ma gestion du temps')),
        body: Column(
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
                Expanded(
                    child: BoutonGenerique(
                        couleur: Colors.red,
                        texte: 'Travail',
                        taille: 60.0,
                        action: methodevide)),
                Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
                Expanded(
                    child: BoutonGenerique(
                        couleur: Colors.green,
                        texte: 'Pause',
                        taille: 60.0,
                        action: methodevide)),
                Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
                Expanded(
                    child: BoutonGenerique(
                        couleur: Colors.blue,
                        texte: 'Maxi Pause',
                        taille: 60.0,
                        action: methodevide)),
                Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Row(
          children: [
            Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
            Expanded(
                child: BoutonGenerique(
                    couleur: Colors.blue,
                    texte: 'Arreter',
                    taille: 60.0,
                    action: methodevide)),
            Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
            Expanded(
                child: BoutonGenerique(
                    couleur: Colors.blue,
                    texte: 'Relancer',
                    taille: 60.0,
                    action: methodevide)),
            Padding(padding: EdgeInsets.all(16.0))
          ],
        ));
  }
}
