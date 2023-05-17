import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pitchupfluttersample/config/values/colors.dart';

import '../../../config/router/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/logo.png'),
          ),
          // Welcome!
          Text(
            'Welcome to Melody!',
            style: GoogleFonts.bebasNeue(
              fontSize: 40,
              color: kBlackColor,
            ),
          ), // Text

          SizedBox(height: 50), // Spacing between words

          // Email Textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ), //Box Decoration
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.black),
                  ), // InputDecoration
                ), //TextField
              ), //Padding
            ), //Container
          ), //Padding

          SizedBox(height: 10), // Spacing between words

          // Password Textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ), //Box Decoration
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.black),
                  ), // InputDecoration
                ), //TextField
              ), //Padding
            ), //Container
          ), //Padding

          SizedBox(height: 10), // Spacing between boxes

          // Sign in button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ElevatedButton(
              onPressed: () {
                context.go('/page');
              },
              // padding: EdgeInsets.all(25),
              // decoration: BoxDecoration(
              //   color: Colors.lightGreen,
              //   //border: BorderRadius.circular(12),
              // ), // BoxDecoration
              child: Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.green[200],
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ), //TextStyle
                ), //Text
              ), //Center
            ), //Container
          ), //Padding

          SizedBox(height: 10),

          // Not a member? Register now
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Not a member?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ), //TextStyle
            ), //Text
            TextButton(
              onPressed: () {
                context.go('/signup');
              },
              child: Text(
                ' Register now',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ), //TextStyle),
              ),
            ), //Text
          ]) // Row
        ]) //Column
            ), // Center
      ), //SafeArea
    ); // Scaffold
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  } // Widget build
} // _LoginScreenState bracket
