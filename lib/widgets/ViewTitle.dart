import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewTitle extends StatelessWidget {
  final String title;

  const ViewTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Title(
        color: Colors.black,
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
          ),
        ));
  }
}
