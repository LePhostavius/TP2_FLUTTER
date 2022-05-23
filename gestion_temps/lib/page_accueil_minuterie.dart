// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'widgets.dart';

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
                Padding(padding: EdgeInsets.all(16.0)),
                Expanded(
                    child: BoutonGenerique(
                        couleur: Colors.red,
                        texte: 'ho',
                        taille: 60.0,
                        action: methodevide)),
                Padding(padding: EdgeInsets.all(16.0)),
                Expanded(
                    child: BoutonGenerique(
                        couleur: Colors.green,
                        texte: 'ho',
                        taille: 60.0,
                        action: methodevide)),
                Padding(padding: EdgeInsets.all(16.0)),
                Expanded(
                    child: BoutonGenerique(
                        couleur: Colors.blue,
                        texte: 'ho',
                        taille: 60.0,
                        action: methodevide)),
                Padding(padding: EdgeInsets.all(16.0)),
              ],
            )
          ],
        ));
  }
}
