import 'package:flutter/material.dart';

class BoutonGenerique extends StatelessWidget {
  final Color couleur;
  final String texte;
  final double taille;
  final VoidCallback action;
  //constructeur
  const BoutonGenerique({
    Key? key,
    required this.couleur,
    required this.texte,
    required this.taille,
    required this.action,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        this.texte,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: this.action,
      color: this.couleur,
      minWidth: this.taille,
    );
  }
}

typedef CallbackSetting = void Function(String, int);

class BoutonParametre extends StatelessWidget {
  final Color couleur;
  final String texte;
  final int valeur;
  final String parametre;
  final CallbackSetting action;
  BoutonParametre({
    Key? key,
    required this.couleur,
    required this.texte,
    required this.valeur,
    required this.parametre,
    required this.action,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        this.texte,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => this.action(this.parametre, this.valeur),
      color: this.couleur,
    );
  }
}
