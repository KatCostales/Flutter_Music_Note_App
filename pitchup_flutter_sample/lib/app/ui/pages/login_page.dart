import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child:Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("assets/Green_and_White_Music_Logo.png"),
              fit: BoxFit.fill,
          )
        )
    );
        // Welcome!
        Text(
          'Welcome to Melody!',
          style: GoogleFonts.bebasNeue(
            fontSize: 55,
          ),
          ), // Text
          
        SizedBox(height: 50),   // Spacing between words

        // Email Textfield
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
            decoration: BoxDecoratin(
              color: Colors.grey[200],
              border: Border.all(color:Colors.white),
              borderRadius: borderRadius.circular(12),
            ),  //Box Decoration
            child: Padding (
              padding: const EdgeInsets.only(left:20.0),
                child: Textfield(
                 decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
               ), // InputDecoration
            ), //TextField
           ), //Padding
           ), //Container
        ),  //Padding
 
        SizedBox(height: 10),   // Spacing between words

        // Password Textfield
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color:Colors.white),
              borderRadius: borderRadius.circular(12),
            ),  //Box Decoration
            child: Padding (
              padding: const EdgeInsets.only(left:20.0),
                child: Textfield(
                  obscureText: true,
                 decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
               ), // InputDecoration
            ), //TextField
           ), //Padding
           ), //Container
        ),  //Padding
        SizedBox(height: 10),   // Spacing between words


        // Sign in button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0).
          child: Container(
            padding: EdgeInsets.all(25),
        decoration: BoxDecoration (
          color: Colors.lightgreen,
          border: BorderRadius.circular(12),
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
      )  //Padding

      SizedBox(height: 10),

        // Not a member? Register now
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text (
              'Not a member?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
                ), //TextStyle 
              ),  //Text
            Text (
              ' Register now',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
                ), //TextStyle
              ) //Text
            ] 
         ) // Row
        ]
      ) //Column
        ),  // Center
      ), //SafeArea
    ); // Scaffold
  } // Widget build
} // _LoginScreenState bracket
