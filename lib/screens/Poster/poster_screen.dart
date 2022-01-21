import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PosterScreen extends StatefulWidget {
  const PosterScreen({Key key}) : super(key: key);

  @override
  _PosterScreenState createState() => _PosterScreenState();
}

class _PosterScreenState extends State<PosterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            "https://images.unsplash.com/photo-1616518015080-0b67441d465a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                "Sound of Music",
                textAlign: TextAlign.center,
                style: GoogleFonts.bebasNeue(
                  textStyle: TextStyle(
                      color: const Color(0xfffffb08),
                      //fontFamily: GoogleFonts.lato(),
                      letterSpacing: 10,
                      fontSize: 120,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}
