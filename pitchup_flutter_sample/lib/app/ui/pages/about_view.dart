import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatelessWidget {
  const AboutView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'About',
              style: GoogleFonts.montserratAlternates(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
            child Text (
              'Welcome to Melody! A learning tool towards reading sheet music and honing your musical talents',
              style: GoogleFonts.montserratAlternates(
                fontSize: 40,
                fontWeight: FontWeight.w300,  //makes text lighter
              ),
            body: new Container(      // add image
            color: Colors.grey[200],
            child: new Image.asset('assets/pianoSheetMusic.jpg'),
            alignment: Alignment.center,
            )
          ),
        ),
      ),
    );
  }
}
