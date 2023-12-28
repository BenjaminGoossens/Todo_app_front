import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_front/screens/Home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(titleTextStyle: GoogleFonts.montserrat()),
          textTheme: GoogleFonts.mondaTextTheme(Theme.of(context).textTheme)),
      home: const Home(),
    );
  }
}
