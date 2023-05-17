import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pitchupfluttersample/config/values/values.dart';

class AboutView extends StatelessWidget {
  const AboutView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'About',
                style: GoogleFonts.montserratAlternates(
                  // mainAxisAlignment = MainAxisAlignment.center,
                  color: Colors.black,
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Text(
            'Welcome to Melody! A learning tool towards reading sheet music and honing your musical talents',
            style: GoogleFonts.montserratAlternates(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.w300, //makes text lighter
            ),
          ),
          Container(
            // add image
            //color: Colors.grey[200],
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              image:  DecorationImage(
                fit:BoxFit.cover,
                image: AssetImage('assets/pianoSheetMusic.jpg')
              )
            ),
          ),
        ],
      ),
    );
  }
}
