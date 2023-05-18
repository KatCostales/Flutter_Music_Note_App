import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactView extends StatelessWidget {
  const ContactView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          Center(
              child: FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Contact Us!',
                style: GoogleFonts.montserratAlternates(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),

          // Contact Box - full name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ), //Box Decoration
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Full Name',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20), // Spacing between words

          // Phone Number Contact
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ), //Box Decoration
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20), // Spacing between words

          // Email Contact
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ), //Box Decoration
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
