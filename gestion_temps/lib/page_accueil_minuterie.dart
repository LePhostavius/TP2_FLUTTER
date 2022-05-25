import 'package:flutter/material.dart';
import 'package:gestion_temps/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:gestion_temps/minuteur.dart';
import 'package:gestion_temps/page_parametres.dart';

import 'main.dart';

class PageAccueilMinuterie extends StatelessWidget {
  PageAccueilMinuterie({Key? key}) : super(key: key);

  final Minuteur minuteur = Minuteur();

  void allerParametres(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PageParametres()));
  }

  @override
  Widget build(BuildContext context) {
    final List<PopupMenuItem<String>> elementsMenu = [];
    minuteur.demarrerTravail();
    elementsMenu.add(
        const PopupMenuItem(value: 'Paramètres', child: Text('Paramètres')));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ma gestion du temps'),
          actions: <Widget>[
            PopupMenuButton(itemBuilder: (BuildContext context) {
              return elementsMenu.toList();
            }, onSelected: (s) {
              allerParametres(
                  context); //pas de pop puisque la flèche permet déjà le retour
            }),
          ],
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints contraints) {
          final double largeurDisponible = contraints.maxWidth;
          return Column(children: [
            Row(children: [
              const Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
              Expanded(
                  child: BoutonGenerique(
                      couleur: Colors.teal,
                      texte: 'Travail',
                      taille: 60,
                      action: minuteur.demarrerTravail)),
              const Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
              Expanded(
                  child: BoutonGenerique(
                      couleur: Colors.grey,
                      texte: 'Mini pause',
                      taille: 60,
                      action: () {
                        minuteur.demarrerPause(false);
                      })),
              const Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
              Expanded(
                  child: BoutonGenerique(
                      couleur: Colors.blueGrey,
                      texte: 'Maxi pause',
                      taille: 60,
                      action: () {
                        minuteur.demarrerPause(true);
                      })),
              const Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT))
            ]),
            Expanded(
              child: StreamBuilder(
                initialData: ModeleMinuteur('00:00', 1),
                stream: minuteur.stream(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  ModeleMinuteur minuteur = snapshot.data;
                  return Container(
                    child: CircularPercentIndicator(
                      radius: largeurDisponible / 6,
                      lineWidth: 10.0,
                      percent: minuteur.pourcentage,
                      center: Text(
                        minuteur.temps,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      progressColor: const Color(0xff009688),
                    ),
                  );
                },
              ),
            ),
          ]);
        }),
        bottomNavigationBar: Row(children: [
          const Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
          Expanded(
              child: BoutonGenerique(
                  couleur: Colors.red,
                  texte: 'Arrêter',
                  taille: 80,
                  action: minuteur.arreterMinuteur)),
          const Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
          const Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
          Expanded(
              child: BoutonGenerique(
                  couleur: Colors.green,
                  texte: 'Relancer',
                  taille: 80,
                  action: minuteur.relancerMinuteur)),
          const Padding(padding: EdgeInsets.all(REMPLISSAGE_DEFAUT)),
        ]));
  }
}
