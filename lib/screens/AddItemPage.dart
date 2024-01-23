import 'dart:convert';
import 'package:http/http.dart' as http;


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
              FutureBuilder(
                future: fetchData(), // Function to perform the GET request
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text(snapshot.data ?? '');
                  }
                },
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Nouvel élément'),
              ),
              SizedBox(height: 20),
              IconButton(
                onPressed: () async {
                  final response = await http.post(
                    Uri.parse('http://localhost:8080/todo-list'),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode({'name': _controller.text}),
                  );
                  Text('//////////////////////////////////////');
                  print(response);
                  print('CHECK/////////////');

                  if (response.statusCode == 200) {
                    print('Liste créée');
                  } else {
                    print('Erreur : ${response.statusCode}');
                  }

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
  Future<String> fetchData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/todo-list'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
