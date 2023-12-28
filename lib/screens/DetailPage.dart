import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String pageTitle;

  DetailPage(this.pageTitle);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<String> elements = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: elements.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(elements[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onFieldSubmitted: (value) {
                setState(() {
                  elements.add(value);
                });
              },
              decoration: InputDecoration(
                labelText: 'Ajouter un élément',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      elements.add(elements as String);
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}