import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class ModeleMinuteur {
  String temps;
  double pourcentage;

  ModeleMinuteur(this.temps, this.pourcentage);
}

class Minuteur {
  double _rayon = 1;
  bool _estActif = true;
  Duration _temps = Duration();
  Duration _tempsTotal = Duration();
  int tempsTravail = 30;
  int tempsPauseCourte = 5;
  int tempsPauseLongue = 20;

  void lireParametres() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    int? tempsTravail = preferences.getInt(CLE_TEMPS_TRAVAIL);
    if (tempsTravail == null) {
      await preferences.setInt(CLE_TEMPS_TRAVAIL, TEMPS_TRAVAIL_DEFAUT);
      this.tempsTravail = TEMPS_TRAVAIL_DEFAUT;
    } else {
      this.tempsTravail = tempsTravail;
    }
    int? tempsPauseCourte = preferences.getInt(CLE_PAUSE_COURTE);
    if (tempsPauseCourte == null) {
      await preferences.setInt(CLE_PAUSE_COURTE, TEMPS_PAUSE_COURTE_DEFAUT);
      this.tempsPauseCourte = TEMPS_PAUSE_COURTE_DEFAUT;
    } else {
      this.tempsPauseCourte = tempsPauseCourte;
    }
    int? tempsPauseLongue = preferences.getInt(CLE_PAUSE_LONGUE);
    if (tempsPauseLongue == null) {
      await preferences.setInt(CLE_PAUSE_LONGUE, TEMPS_PAUSE_LONGUE_DEFAUT);
      this.tempsPauseLongue = TEMPS_PAUSE_LONGUE_DEFAUT;
    } else {
      this.tempsPauseLongue = tempsPauseLongue;
    }
  }

  void demarrerPause(bool a) async {
    lireParametres();
    _temps = a
        ? Duration(minutes: tempsPauseLongue)
        : Duration(minutes: tempsPauseCourte);
    _tempsTotal = a
        ? Duration(minutes: tempsPauseLongue)
        : Duration(minutes: tempsPauseCourte);
  }

  void demarrerTravail() async {
    lireParametres();
    _temps = Duration(minutes: tempsTravail);
    _tempsTotal = Duration(minutes: tempsTravail);
  }

  void arreterMinuteur() {
    _estActif = false;
  }

  void relancerMinuteur() {
    if (_estActif == false && _temps.inMinutes > 0) {
      _estActif = true;
    }
    return;
  }

  String retournerTemps(Duration t) {
    String minutes = (t.inMinutes < 10)
        ? '0' + t.inMinutes.toString()
        : t.inMinutes.toString();
    int numSecondes = t.inSeconds - (t.inMinutes * 60);
    String secondes = (numSecondes < 10)
        ? '0' + numSecondes.toString()
        : numSecondes.toString();
    String tempsFormate = minutes + ':' + secondes;
    return tempsFormate;
  }

  Stream<ModeleMinuteur> stream() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int a) {
      String temps;
      if (this._estActif) {
        _temps = _temps - Duration(seconds: 1);
        _rayon = _temps.inSeconds / _tempsTotal.inSeconds;
        if (_temps.inSeconds <= 0) {
          _estActif = false;
        }
      }
      temps = retournerTemps(_temps);
      return ModeleMinuteur(temps, _rayon);
    });
  }
}
