import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_front/screens/TodoList.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Ma\n',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30.0),
                    children: [
                      TextSpan(
                        text: 'SUPER\n'.toUpperCase(),
                      ),
                      TextSpan(
                        text: 'todo'.toUpperCase(),
                      ),
                      TextSpan(
                        text: 'List',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Form(
                    child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TodoList()),
                        );
                      },
                      child: Text('Aller à la deuxième page',
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
