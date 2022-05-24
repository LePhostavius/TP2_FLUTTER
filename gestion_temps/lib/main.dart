import 'package:flutter/material.dart';
import 'page_accueil_minuterie.dart';

void main() {
  runApp(MyApp());
}

const double REMPLISSAGE_DEFAUT = 5.0;

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
