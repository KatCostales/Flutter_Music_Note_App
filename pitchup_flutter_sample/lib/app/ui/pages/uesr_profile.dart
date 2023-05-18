import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/router/routes.dart';
import '../../../mysql/mysql.dart';
import '../../../mysql/user.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var db = Mysql();
  var email = '';
  var password = '';
  var name = '';
  var phone = '';
  var temp = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 100),
          // Welcome!
          Text(
            'Isaac Teo',
            style: GoogleFonts.bebasNeue(
              fontSize: 40,
            ),
            textAlign: TextAlign.center,
          ), // Text

          CircleAvatar(
            backgroundImage: AssetImage('assets/profileIcon.png'),
            radius: 150,
          ),

          // SizedBox(height: 20), // Spacing between words

          // // Name Text
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       border: Border.all(color: Colors.black),
          //       // borderRadius: BorderRadius.circular(12),
          //     ), //Box Decoration
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 20.0),
          //       child: Text(
          //         'Name: Isaac Teo',
          //       ),
          //     ), //Padding
          //   ), //Container
          // ), //Padding

          // SizedBox(height: 20), // Spacing between words

          // // Music Proficiency Level
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       border: Border.all(color: Colors.black),
          //       // borderRadius: BorderRadius.circular(12),
          //     ), //Box Decoration
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 20.0),
          //       child: Text(
          //         'Music Proficiency Level: Beginner',
          //       ),
          //     ), //Padding
          //   ), //Container
          // ), //Padding

          // SizedBox(height: 20), // Spacing between words

          // // Instruments used
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //       border: Border.all(color: Colors.black),
          //       // borderRadius: BorderRadius.circular(12),
          //     ), //Box Decoration
          //     child: Padding(
          //       padding: const EdgeInsets.only(left: 20.0),
          //       child: Text(
          //         'Instrument: Piano',
          //       ),
          //     ), //Padding
          //   ), //Container
          // ), //Padding

          SizedBox(height: 50), // Spacing between words

          // Email Textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SizedBox(
              width: 300,
              height: 300,
              child: Container(
                decoration: BoxDecoration(
                    // color: Colors.grey[200],
                    // border: Border.all(color: Colors.black),
                    // borderRadius: BorderRadius.circular(12),
                    ), //Box Decoration
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Music Proficiency Level: Beginner\n\nInstrument: Piano\n\nEmail: Iteo24@my.whitworth.edu',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ), //Padding
              ),
            ), //Container
          ), //Padding

          // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //   TextButton(
          //     onPressed: () {
          //       context.go('/');
          //     },
          //     child: Text(
          //       'Log ',
          //       style: TextStyle(
          //         color: Colors.blue,
          //         fontWeight: FontWeight.bold,
          //       ), //TextStyle),
          //     ),
          //   ), //Text
          // ]) // Row
        ]) //Column
            ), // Center
      ), //SafeArea
    ); // Scaffold
  } // Widget build
} // _LoginScreenState bracket
