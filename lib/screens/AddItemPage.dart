import 'package:flutter/material.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ajouter un élément'),
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Nouvel élément'),
              ),
              SizedBox(height: 20),
              IconButton(
                onPressed: () {
                  Navigator.pop(context, _controller.text);
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
