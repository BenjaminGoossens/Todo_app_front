import 'package:flutter/material.dart';

import 'AddItemPage.dart';
import 'DetailPage.dart'; // Importe la classe de la page du formulaire

class TodoList2 extends StatefulWidget {
  const TodoList2({Key? key}) : super(key: key);

  @override
  State<TodoList2> createState() => _TodoList2State();
}

class _TodoList2State extends State<TodoList2> {
  List<String> maListe = ["Bouton 1", "Bouton 2", "Bouton 3", "S"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Boutons depuis un tableau'),
        ),
        body: ListView.builder(
          itemCount: maListe.length + 1, // +1 pour le bouton d'ajout
          itemBuilder: (BuildContext context, int index) {
            if (index == maListe.length) {
              return ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddItemPage()),
                  );

                  if (result != null) {
                    setState(() {
                      maListe.add(result);
                    });
                  }
                },
                child: Text('Ajouter un élément'),
              );
            }

            return ElevatedButton(
              onPressed: () {
                // Naviguer vers la page de détail avec le nom du bouton comme titre
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => DetailPage(maListe[index]),
                ),
                );
              },
              child: Text(maListe[index]),
            );
          },
        ),
      ),
    );
  }
}