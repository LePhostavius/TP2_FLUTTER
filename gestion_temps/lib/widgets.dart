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
