import 'package:flutter/material.dart';

import '../widgets/ViewTitle.dart';
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
          title: const ViewTitle(
            title: "MY TODO LISTS",
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: maListe.length, // +1 pour le bouton d'ajout
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(maListe[index]),
                    leading: const Icon(Icons.radio_button_off),
                    onTap: () {
                      // Naviguer vers la page de détail avec le nom du bouton comme titre
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(maListe[index]),
                        ),
                      );
                    },
                  );
                },
              ),
              ElevatedButton(
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
                child: Text('NEW LIST'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
