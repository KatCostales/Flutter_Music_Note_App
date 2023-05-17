import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget{
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child:Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
        // Welcome!
        Text(
          'Sign up to Become a Member!',
          style: GoogleFonts.bebasNeue(
            fontSize: 55,
          ),
          ), // Text
          
        SizedBox(height: 50),   // Spacing between words

        // Name Textfield
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color:Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),  //Box Decoration
            child: Padding (
              padding: const EdgeInsets.only(left:20.0),
                child: TextField(
                 decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'First Name',
               ), // InputDecoration
            ), //TextField
           ), //Padding
           ), //Container
        ),  //Padding
 
        SizedBox(height: 20),   // Spacing between words

        // Email Textfield
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color:Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),  //Box Decoration
            child: Padding (
              padding: const EdgeInsets.only(left:20.0),
                child: TextField(
                 decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
               ), // InputDecoration
            ), //TextField
           ), //Padding
           ), //Container
        ),  //Padding
 
        SizedBox(height: 20),   // Spacing between words

        // Phone Textfield
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color:Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),  //Box Decoration
            child: Padding (
              padding: const EdgeInsets.only(left:20.0),
                child: TextField(
                 decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Phone Number',
               ), // InputDecoration
            ), //TextField
           ), //Padding
           ), //Container
        ),  //Padding
 

        // Sign in button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            padding: EdgeInsets.all(25),
        decoration: BoxDecoration (
          color: Colors.lightGreen,
          //border: BorderRadius.circular(12),
          ),  // BoxDecoration
        child: Center(
          child: Text ('Sign In',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,

             ), //TextStyle
            ), //Text
          ), //Center
        ), //Container
      ),  //Padding

      SizedBox(height: 10),
        ]
      ) //Column
        ),  // Center
      ), //SafeArea
    ); // Scaffold
  } // Widget build
} // _LoginScreenState bracket
