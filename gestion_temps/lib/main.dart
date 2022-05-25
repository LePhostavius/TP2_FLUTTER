import 'package:flutter/material.dart';
import 'page_accueil_minuterie.dart';

const String CLE_TEMPS_TRAVAIL = 'Temps de travail';
const String CLE_PAUSE_COURTE = 'Pause courte';
const String CLE_PAUSE_LONGUE = 'Pause longue';
const int TEMPS_TRAVAIL_DEFAUT = 30;
const int TEMPS_PAUSE_COURTE_DEFAUT = 5;
const int TEMPS_PAUSE_LONGUE_DEFAUT = 20;
const double REMPLISSAGE_DEFAUT = 5.0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion du temps',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: PageAccueilMinuterie(), //ref a l'import du dessus
    );
  }
}
