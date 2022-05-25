import 'package:flutter/material.dart';
import 'package:gestion_temps/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class PageParametres extends StatelessWidget {
  const PageParametres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Paramètres')),
        body: const Parametres());
  }
}

class Parametres extends StatefulWidget {
  const Parametres({Key? key}) : super(key: key);

  @override
  State<Parametres> createState() => _ParametresState();
}

class _ParametresState extends State<Parametres> {
  TextEditingController txtTempsTravail = TextEditingController();
  TextEditingController txtTempsPauseCourte = TextEditingController();
  TextEditingController txtTempsPauseLongue = TextEditingController();

  @override
  void initState() {
    lireParametres();
    super.initState();
  }

  void majParametres(String key, int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    switch (key) {
      case CLE_TEMPS_TRAVAIL:
        int tempsTravail =
            preferences.getInt(CLE_TEMPS_TRAVAIL) ?? TEMPS_TRAVAIL_DEFAUT;
        tempsTravail += value;
        if (tempsTravail >= 1 && tempsTravail <= 180) {
          preferences.setInt(CLE_TEMPS_TRAVAIL, tempsTravail);
        }
        setState(() {
          txtTempsTravail.text = tempsTravail.toString();
        });
        break;
      case CLE_PAUSE_COURTE:
        int pauseCourte =
            preferences.getInt(CLE_PAUSE_COURTE) ?? TEMPS_TRAVAIL_DEFAUT;
        pauseCourte += value;
        if (pauseCourte >= 1 && pauseCourte <= 180) {
          preferences.setInt(CLE_PAUSE_COURTE, pauseCourte);
        }
        setState(() {
          txtTempsPauseCourte.text = pauseCourte.toString();
        });
        break;
      case CLE_PAUSE_LONGUE:
        int pauseLongue =
            preferences.getInt(CLE_PAUSE_LONGUE) ?? TEMPS_TRAVAIL_DEFAUT;
        pauseLongue += value;
        if (pauseLongue >= 1 && pauseLongue <= 180) {
          preferences.setInt(CLE_PAUSE_LONGUE, pauseLongue);
        }
        setState(() {
          txtTempsPauseLongue.text = pauseLongue.toString();
        });
        break;
    }
  }

  lireParametres() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? tempsTravail = preferences.getInt(CLE_TEMPS_TRAVAIL);
    if (tempsTravail == null) {
      await preferences.setInt(CLE_TEMPS_TRAVAIL, TEMPS_TRAVAIL_DEFAUT);
    }
    int? tempsPauseCourte = preferences.getInt(CLE_PAUSE_COURTE);
    if (tempsPauseCourte == null) {
      await preferences.setInt(CLE_PAUSE_COURTE, TEMPS_PAUSE_COURTE_DEFAUT);
    }
    int? tempsPauseLongue = preferences.getInt(CLE_PAUSE_LONGUE);
    if (tempsPauseLongue == null) {
      await preferences.setInt(CLE_PAUSE_LONGUE, TEMPS_PAUSE_LONGUE_DEFAUT);
    }
    setState(() {
      txtTempsTravail.text = tempsTravail.toString();
      txtTempsPauseCourte.text = tempsPauseCourte.toString();
      txtTempsPauseLongue.text = tempsPauseLongue.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle styleTexte = const TextStyle(fontSize: 20.0);
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        childAspectRatio: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Temps de travail'),
          const Text(''),
          const Text(''),
          BoutonParametre(
              action: majParametres,
              couleur: Colors.blueGrey,
              texte: '-',
              parametre: CLE_TEMPS_TRAVAIL,
              valeur: -1),
          TextField(
              style: styleTexte,
              keyboardType: TextInputType.number,
              controller: txtTempsTravail),
          BoutonParametre(
              action: majParametres,
              couleur: Colors.green,
              texte: '+',
              parametre: CLE_TEMPS_TRAVAIL,
              valeur: 1),
          const Text('Temps pause courte'),
          const Text(''),
          const Text(''),
          BoutonParametre(
              action: majParametres,
              couleur: Colors.blueGrey,
              texte: '-',
              parametre: CLE_PAUSE_COURTE,
              valeur: -1),
          TextField(
              style: styleTexte,
              keyboardType: TextInputType.number,
              controller: txtTempsPauseCourte),
          BoutonParametre(
              action: majParametres,
              couleur: Colors.green,
              texte: '+',
              parametre: CLE_PAUSE_COURTE,
              valeur: 1),
          const Text('Temps pause longue'),
          const Text(''),
          const Text(''),
          BoutonParametre(
              action: majParametres,
              couleur: Colors.blueGrey,
              texte: '-',
              parametre: CLE_PAUSE_LONGUE,
              valeur: -1),
          TextField(
              style: styleTexte,
              keyboardType: TextInputType.number,
              controller: txtTempsPauseLongue),
          BoutonParametre(
              action: majParametres,
              couleur: Colors.green,
              texte: '+',
              parametre: CLE_PAUSE_LONGUE,
              valeur: 1),
        ],
      ),
    );
  }
}
