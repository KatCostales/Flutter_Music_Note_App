import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
        color: Colors.white,
        child: Column(children: [
          FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              // child: Text(
              //   'Home',
              //   style: GoogleFonts.montserratAlternates(
              //     fontSize: 80,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ),
          ),
          Container(
            // add image
            color: Colors.grey[200],
            alignment: Alignment.center,
            child: Image.asset('assets/welcomeImage.png'),
          ),
        ]));
  }
}
