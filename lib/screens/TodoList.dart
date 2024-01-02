import 'package:flutter/material.dart';

import '../widgets/ViewTitle.dart';
import 'AddItemPage.dart';
import 'DetailPage.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> maListe = ["Bouton 1", "Bouton 2", "Bouton 3", "S"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 150.0,),
                Text(
                  "MY TODO LISTS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),


                ),
                SizedBox(height: 50.0,),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: maListe.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(maListe[index]),
                          leading: const Icon(Icons.radio_button_on),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(maListe[index]),
                              ),
                            );
                          },
                        ),
                        Container(
                          width: 250.0,
                          child: Divider(
                            thickness: 2.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 100.0,),
                FloatingActionButton(
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
                  child: Icon(Icons.add),
                  backgroundColor: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
